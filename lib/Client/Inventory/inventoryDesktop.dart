//@dart=2.9
import 'dart:convert';
import 'dart:io';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class InventoryDesktop extends StatefulWidget {
  final String userName;

  InventoryDesktop({this.userName});

  @override
  _InventoryDesktopState createState() => _InventoryDesktopState();
}

class _InventoryDesktopState extends State<InventoryDesktop> {
  //Image QR_code=Image.asset("");
  File image;
  final picker = ImagePicker();
  bool message1 = true;
  bool message2 = true;
  var setData = "http://localhost:8080/ERP project/setAPI.php";
  var getData = "http://localhost:8080/ERP project/getAPI.php";
  var setImageData = "http://localhost:8080/ERP project/SetImageAPI.php";
  var data, response;
  TextEditingController Name = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController SKU = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController QR_code = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Quantity = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Image_of_product = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController NAME_Image_of_product = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Cost_price = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Variant = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Selling_price = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Compared_at_price = TextEditingController();

  // ignore: non_constant_identifier_names

  Future choosePhoto() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
      setState(() {});
    }
  }

  // Future imageEncoder() async{
  //   if(file==null)
  //     return;
  //   String base64 = base64Encode(file.readAsBytesSync());
  //   String imageName = file.path.split("/").last;
  //   print(imageName);
  // }

  // ignore: non_constant_identifier_names
  // AddData() async {
  //   print(Image_of_product.text);
  //   data = {
  //     "command": "INSERT INTO `product`(`Name`, `SKU`, `QR code`,"
  //         " `Quantity`, `Image of product`, `Cost price`, `Variant`, `Selling price`, `Compared at price`) VALUES ('"
  //         "${Name.text}','${SKU.text}','${QR_code.text}','${Quantity.text}','${Image_of_product.text}'"
  //         ",'${Cost_price.text}','${Variant.text}','${Selling_price.text}','${Compared_at_price.text}')"
  //   };
  //   // var request =http.MultipartRequest('POST',Uri.parse(setData));
  //   // var pic = await http.MultipartFile.fromPath('Image of product',image.path);
  //   // request.files.add(pic);
  //   response = await http.post(Uri.parse(setData), body: data);
  //   if (200 == response.statusCode) {
  //     return message1;
  //   } else {
  //     return !message1;
  //   }
  // }

  // ignore: non_constant_identifier_names
  AddData() async {
    print(Image_of_product.text);
    var request = http.MultipartRequest('POST', Uri.parse(setImageData));
    request.fields['Name'] = Name.text;
    request.fields['SKU'] = SKU.text;
    request.fields['QR code'] = QR_code.text;
    request.fields['Image of product'] = Image_of_product.text;
    request.fields['Quantity'] = Quantity.text;
    request.fields['Cost price'] = Cost_price.text;
    request.fields['Variant'] = Variant.text;
    request.fields['Selling_price'] = Selling_price.text;
    request.fields['Compared_at_price'] = Compared_at_price.text;
    var pic = await http.MultipartFile.fromPath(
        'Image of product', Image_of_product.text);
    request.files.add(pic);
    var response = await request.send();
    if (200 == response.statusCode) {
      return message1;
    } else {
      return !message1;
    }
  }

  // ignore: non_constant_identifier_names
  DeleteData() async {
    data = {"command": "DELETE FROM `product` WHERE SKU ='${SKU.text}'"};
    response = await http.post(Uri.parse(setData), body: data);
    if (200 == response.statusCode) {
      return message1;
    } else {
      return !message1;
    }
  }

  // ignore: non_constant_identifier_names
  UpdateData() async {
    data = {
      "command": "UPDATE `product` SET `Name`='${Name.text}',`QR code`='${QR_code.text}'"
          ",`Quantity`='${Quantity.text}',`Image of product`='${Image_of_product.text}',`Cost price`='${Cost_price.text}'"
          ",`Variant`='${Variant.text}',`Selling price`='${Selling_price.text}',`Compared at price`='${Compared_at_price.text}'"
          "where SKU = '${SKU.text}'"
    };
    response = await http.post(Uri.parse(setData), body: data);
    if (200 == response.statusCode) {
      return message1;
    } else {
      return !message1;
    }
  }

  // ignore: non_constant_identifier_names
  SelectData() async {
    data = {"command": "select * from product"};
    return await http
        .post(Uri.parse(getData), body: data)
        .then((http.Response response) {
      final List fetchData = json.decode(response.body);
      var i = 0;
      fetchData.forEach((product) {
        setState(() {
          Name.text = product['Name'];
          SKU.text = product['SKU'];
          QR_code.text = product['QR code'];
          Quantity.text = product['Quantity'];
          Image_of_product.text = product['Image of product'];
          Cost_price.text = product['Cost price'];
          Variant.text = product['Variant'];
          Selling_price.text = product['Selling price'];
          Compared_at_price.text = product['Compared at price'];
          print(i++);
        });
      });
    });
  }

  Future uploadImage() async {}

  // Widget decideImageView() {
  //   if (image == null)
  //     return Text("Image not Selected");
  //   else
  //     return Image.file(
  //       image,
  //       width: 200,
  //       height: 200,
  //     );
  // }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Color(0xFFE8E8E8),
        appBar: PreferredSize(
          preferredSize: Size(30, 70),
          child: ClientAppBar(
            userName: widget.userName,
          ),
        ),
        body: SingleChildScrollView(
          child: ChangeNotifierProvider<MyProvider>(
              create: (context) => MyProvider(),
              child: Consumer<MyProvider>(builder: (context, provider, child) {
                return Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    bottom: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white),
                          width: width * 0.7,
                          height: 1200,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 70,
                              right: 70,
                            ),
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // implementing a column to call custom label widget with sizedBox between them
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            textField(Name, width * 0.20, 40.0,
                                                false, 'Name'),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            textField(SKU, width * 0.20, 40.0,
                                                false, 'SKU'),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            textField(QR_code, width * 0.20,
                                                40.0, false, 'QR Code'),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            textField(Quantity, width * 0.20,
                                                40.0, false, 'Quantity'),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            Row(children: [
                                              textField(
                                                  Image_of_product,
                                                  width * 0.20,
                                                  40.0,
                                                  false,
                                                  'Image of product'),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              IconButton(
                                                  onPressed: () async {
                                                    var image =
                                                        await ImagePicker()
                                                            .getImage(
                                                                source:
                                                                    ImageSource
                                                                        .gallery);
                                                    provider.setImage(image);
                                                    setState(() {
                                                      Image_of_product.text =
                                                          provider.image.path;
                                                      // Image_of_product.text=base64Encode(file.readAsBytesSync());
                                                      print(Image_of_product
                                                          .text);
                                                      // try{
                                                      //   NAME_Image_of_product.text=provider.image.path.split('/').last;
                                                      //   Image_of_product.text= provider.image.path;
                                                      //   AddData();
                                                      // }catch(e){
                                                      //   print(e);
                                                      // }
                                                    });
                                                  },
                                                  icon: Icon(Icons
                                                      .camera_alt_outlined))
                                            ]),
                                            if (provider.image != null)
                                              Image.network(
                                                provider.image.path,
                                                height: 120,
                                              ),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            textField(Cost_price, width * 0.20,
                                                40.0, false, 'Cost price'),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            textField(Variant, width * 0.20,
                                                40.0, false, 'Variant'),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            textField(
                                                Selling_price,
                                                width * 0.20,
                                                40.0,
                                                false,
                                                'Selling price'),
                                            SizedBox(
                                              height: 30,
                                            ),
                                            textField(
                                                Compared_at_price,
                                                width * 0.20,
                                                40.0,
                                                false,
                                                'Compared at price'),
                                          ],
                                        ),
                                        SizedBox(
                                          width: width * 0.04,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: width * 0.3,
                                            ),
                                            SizedBox(
                                              height: 801,
                                            ),
                                            actionButtons("ADD", AddData,
                                                Color(0xFF00B9FF))
                                          ],
                                        )

                                        // implementing a column to call custom drop down list, text field and
                                        // password field widget with sizedBox between them.
                                        // Column(
                                        //     crossAxisAlignment:
                                        //         CrossAxisAlignment.end,
                                        //
                                        //     children: [
                                        //       Container(
                                        //         alignment: Alignment.centerLeft,
                                        //         width: width * 0.40,
                                        //         height: 0.0,
                                        //       ),
                                        //       SizedBox(
                                        //         height: 15,
                                        //       ),
                                        //       textField(
                                        //           name, width * 0.20, 40.0, true),
                                        //       SizedBox(
                                        //         height: 15,
                                        //       ),
                                        //       textField(
                                        //           SKU, width * 0.20, 40.0, true),
                                        //       SizedBox(
                                        //         height: 15,
                                        //       ),
                                        //       textField(QR_code, width * 0.20,
                                        //           40.0, true),
                                        //       SizedBox(
                                        //         height: 15,
                                        //       ),
                                        //       textField(Quantity, width * 0.20,
                                        //           40.0, true),
                                        //       SizedBox(
                                        //         height: 15,
                                        //       ),
                                        //       textField(Image_of_product,
                                        //           width * 0.20, 40.0, true),
                                        //       SizedBox(
                                        //         height: 15,
                                        //       ),
                                        //       textField(Cost_price, width * 0.20,
                                        //           40.0, true),
                                        //       SizedBox(
                                        //         height: 15,
                                        //       ),
                                        //       textField(Variant, width * 0.20,
                                        //           40.0, true),
                                        //       SizedBox(
                                        //         height: 15,
                                        //       ),
                                        //       textField(Selling_price,
                                        //           width * 0.20, 40.0, true),
                                        //       SizedBox(
                                        //         height: 15,
                                        //       ),
                                        //       textField(Compared_at_price,
                                        //           width * 0.20, 40.0, true),
                                        //       SizedBox(
                                        //         height: 15,
                                        //       )
                                        //     ])
                                      ])
                                ]),
                          )),
                    ],
                  ),
                );
              })),
        ));
  }
// ),
// )

}

class MyProvider extends ChangeNotifier {
  var image;

  Future setImage(img) async {
    this.image = img;
    this.notifyListeners();
  }
}
