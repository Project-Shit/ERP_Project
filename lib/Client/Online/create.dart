// @dart=2.9
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

class create extends StatefulWidget {
  final String userName, type;

  create({this.userName, this.type});

  @override
  _createState createState() => _createState();
}

class _createState extends State<create> {
  List<createModel> model = [];

  TextEditingController _SKU = TextEditingController();
  TextEditingController _Name = TextEditingController();
  TextEditingController _Seliing_price = TextEditingController();
  TextEditingController _q = TextEditingController();
  TextEditingController _cus_id = TextEditingController();

  TextEditingController _cus_Name = TextEditingController();
  TextEditingController _cus_phone = TextEditingController();
  TextEditingController _cus_address = TextEditingController();



  @override

  void initState() {
    super.initState();
    fetchRecords2();
   }

  applytoorder() async {
    try {
      data = {
        "command": "insert into ordern(id,name,phone,address,item id,item name,quantity,state)"
         "values( ${_cus_id.text} ,'${_cus_Name.text}','${_cus_phone.text}',${_cus_address.text},'${_SKU.text}','${_Name.text}', ${_q.text} ,'Unfullfild' )"
      };
      response = await http.post(Uri.parse(setData), body: data);
    } catch (e) {
      print(e);
    }
    fetchRecords2();
  }

  Future fetchRecords2() async {
    setState(() {
      model= [];
    });
    try {
      data = {"command": "SELECT * FROM  onlineorder ORDER BY id DESC LIMIT 1"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((user) {
          setState(() {
            _cus_id.text = user['id'];
            _cus_Name.text = user['name'];
             _cus_phone.text = user['phone'];
            _cus_address.text = user['address'];
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


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: ClientAppBar(
          userName: widget.userName,
          type: widget.type,
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                textField(_SKU, width * 0.6, 40.0, false, 'Inter SKU'),
                SizedBox(
                  height: 30,
                ),

                textField(_q, width * 0.6, 40.0, false, 'Quantity'),

                SizedBox(
                  height: 30,
                ),
                Text(
                 _Name.text

                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                     _Seliing_price.text

                ),
                SizedBox(
                  height: 50,
                ),
                DataTable(
                  columns: [
                     DataColumn(label: Text('Name')),
                    DataColumn(label: Text('SKU')),
                    DataColumn(label: Text('Selling Price')),
                     DataColumn(label: Text('Quantity'),

        ),
                  ],
                  rows: model
                      .map((data) => DataRow(
                    cells: [

                      new DataCell(
                        Text(data.name),
                      ),
                      new DataCell(
                        Text(data.SKU),
                      ),
                      new DataCell(
                        Text(data.Selling_Price),
                      ),
                      new DataCell(
                        Text(data.q  ),
                      ),

                    ],
                  ))
                      .toList(),
                ),
                SizedBox(
                 height: 30,
                ),
                actionButtons('Search', () {
                  search();


                }, Colors.blue.shade600),
                SizedBox(
                  height: 30,
                ),
                actionButtons('Add', () {

               fetchRecords();


                }, Colors.green.shade600),

                SizedBox(
                  height: 30,
                ),
                actionButtons('Create', () {
                   fetchRecords2();
                   applytoorder();


                }, Colors.green.shade600),
              ],
            ),
          ),
        ),
      ),


    );
  }
}
