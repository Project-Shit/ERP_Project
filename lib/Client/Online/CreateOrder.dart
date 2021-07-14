// @dart=2.9
import 'package:erp/Client/Online/crm.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';
import 'package:erp/Client/Crm/crmmarian.dart';
import 'package:erp/Client/Online/createModel.dart';
import 'package:erp/Client/Online/crm.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../constants.dart';
import '../../constants.dart';

class CreateOrder extends StatefulWidget {
  final String userName, type;

  CreateOrder({this.userName, this.type});

  @override
  _CreateOrderState createState() => _CreateOrderState();
}

class _CreateOrderState extends State<CreateOrder> {
  List<createModel> model = [];
  TextEditingController _SKU = TextEditingController();
  TextEditingController _Name = TextEditingController();
  TextEditingController _Seliing_price = TextEditingController();


  Future<Null> search() async {
    try {
      data = {
        "command":
        "select * from product where SKU='${_SKU.text}'"
      };
      return await http
          .post(Uri.parse(getData), body: data)
          .then((http.Response response) {
        final List fetchData = json.decode(response.body);
        fetchData.forEach((product) {
          setState(() {
            _Name.text = product['Name'];
            _Seliing_price.text= product['Selling Price'];
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }


  Future fetchRecords() async {
    setState(() {
      model= [];
    });
    try {
      data = {"command": "SELECT * FROM  product"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((crm) {
          setState(() {
            model.add(new  createModel(

                name: crm['Name'],
                SKU: crm['SKU'],
                Selling_Price: crm['Selling Price'],
                q: crm["Quantity"]
            ));
          });
        });
      });
    } catch (e) {
      print(e);
    }
  }




  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFE8E8E8),
        appBar: PreferredSize(
          preferredSize: Size(30, 70),
          child: ClientAppBar(userName: widget.userName,type: widget.type,),
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: EdgeInsets.only(
                  top: 30,
                  bottom: 30,
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center, children: [
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Colors.white),
                          width: width * 1,
                          height: 1000,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 0,
                              right: 0,
                            ),
                            child: Column(
                                children:[
                                  SizedBox(
                                      height:20
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children:[
                                        SizedBox(
                                          width: 200,
                                        ),
                                        textField(_SKU, width * 0.20, 40.0, false,"Search For SKU"),
                                        SizedBox(
                                          width: 10,
                                        ),

                                        IconButton(onPressed: (){
                                         search();
                                         fetchRecords();
                                          Scaffold();
                                        }, icon: Icon(Icons.search)),
                                        SizedBox(
                                          width: 0,
                                        ),

                                        IconButton(onPressed: (){

                                          Scaffold();
                                        }, icon: Icon(Icons.clear)),
                                        Spacer(
                                          flex: 1,
                                        ),
                                        actionButtons('New Customer', () {
                                        //  Navigator.push(
                                         //   context,
                                        //    MaterialPageRoute(builder: (context) => InventoryDesktop(data: model,userName: widget.userName,type: widget.type,)),
                                        //  );
                                        }, Colors.blue),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        IconButton(onPressed: (){

                                        }, icon: Icon(Icons.refresh)),
                                        SizedBox(
                                          width: 190,
                                        )
                                      ]
                                  ),
                                  SizedBox(
                                      height:20
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        DataTable(
                                            showCheckboxColumn: false,
                                            sortColumnIndex: 0,
                                            sortAscending: true,
                                            columns: [
                                              DataColumn(
                                                label: Text('Name'),
                                              ),
                                              DataColumn(
                                                label: Text('SKU'),
                                              ),



                                              DataColumn(
                                                label: Text('Selling price'),
                                              ),

                                              // Lets add one more column to show a delete button

                                            ],
                                            // the list should show the filtered list now

                                          // <DataRow>[
                                          //    for(int i = 0;i<listSKU.length;i++)
                                          //          showValues(i)
                                          //    ]
                                        )
                                      ])]),
                          ),
                        )
                      ])
                ]
                )
            )
        )
    );
  }
}
