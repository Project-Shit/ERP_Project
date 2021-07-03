//@dart=2.9
import 'dart:convert';
import 'dart:io';

import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';


class InventoryDesktop extends StatefulWidget {
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
  TextEditingController Cost_price = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Variant = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Selling_price = TextEditingController();

  // ignore: non_constant_identifier_names
  TextEditingController Compared_at_price = TextEditingController();

  // ignore: non_constant_identifier_names

  Future choosePhoto() async{
   var pickedImage = await picker.getImage(source: ImageSource.gallery);
   setState(() {
     image  = File(pickedImage.path);
   });
  }

  // Future imageEncoder() async{
  //   if(file==null)
  //     return;
  //   String base64 = base64Encode(file.readAsBytesSync());
  //   String imageName = file.path.split("/").last;
  //   print(imageName);
  // }

  // ignore: non_constant_identifier_names
  AddData() async {
    data = {
      "command": "INSERT INTO `product`(`Name`, `SKU`, `QR code`, `Quantity`, "
          "`Image of product`, `Cost price`, `Variant`, `Selling price`, `Compared at price`) VALUES ("
          "'${Name.text}','${SKU.text}','${QR_code}','${Quantity.text}',"
          "'${Image_of_product.text}','${Cost_price.text}','${Variant.text}',"
          "'${Selling_price.text}','${Compared_at_price.text}')"
    };
    response = await http.post(Uri.parse(setData), body: data);
    if (200 == response.statusCode) {
      return message1;
    } else {
      return !message1;
    }
  }

  // ignore: non_constant_identifier_names
  DeleteData() async {
    data = {
      "command": "DELETE FROM `product` WHERE SKU ='${SKU.text}'"
    };
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

      "command": "UPDATE `product` SET `Name`='${Name.text}',`QR code`='${QR_code}'"
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
      var i=0;
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



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
      appBar: PreferredSize(
        preferredSize: Size(30, 70),
        child: ClientAppBar(),
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // implementing a container to make the outline border design
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.white),
                    width: width * 0.7,
                    height: 3000,
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: 70,
                          right: 70,
                        ),
                        // implementing a column widget to align the rest of the widget
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    // implementing a column to call custom label widget with sizedBox between them
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        labelText('Name'),
                                        textField(
                                            Name, width * 0.20, 40.0, true),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        labelText("SKU"),
                                        textField(
                                            SKU, width * 0.20, 40.0, true),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        labelText("QR code"),
                                        textField(
                                            QR_code, width * 0.20, 40.0, true),
                                        Row(
                                            children: [
                                              FloatingActionButton(onPressed:(){
                                                choosePhoto();
                                               //choose_QR_code_Photo();
                                              },child: Icon(Icons.file_upload),),
                                        ]),
                                        image == null ? Text('') : Image.file(image),
                                        SizedBox(
                                          height: 3000,
                                        ),
                                        labelText('Quantity'),
                                        textField(
                                            Quantity, width * 0.20, 40.0, true),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        labelText('Image of product'),
                                        Row(
                                            children: [
                                              textField(
                                                  Image_of_product, width * 0.20, 40.0, true),
                                              SizedBox(
                                                width:5,
                                              ),
                                              IconButton(onPressed: choosePhoto, icon: Icon(Icons.camera_alt_outlined))
                                            ]),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        labelText('Cost price'),
                                        textField(Cost_price, width * 0.20,
                                            40.0, true),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        labelText('Variant'),
                                        textField(
                                            Variant, width * 0.20, 40.0, true),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        labelText('Selling price'),
                                        textField(Selling_price, width * 0.20,
                                            40.0, true),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        labelText('Compared at price'),
                                        textField(Compared_at_price,
                                            width * 0.20, 40.0, true)
                                      ],
                                    ),
                                    SizedBox(
                                      width: width * 0.04,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: width * 0.3,
                                        ),
                                        SizedBox(
                                          height: 801,
                                        ),
                                        actionButtons("ADD", DeleteData, Color(0xFF00B9FF))
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
                            ]))),
              ]))),
    );
  }
}
