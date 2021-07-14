// @dart=2.9
import 'dart:convert';
import 'package:erp/Client/POS/posModel.dart';
import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PointData extends StatefulWidget {
  final String userName, type;

  PointData({this.userName, this.type});
  @override
  _PointDataState createState() => _PointDataState();
}

class _PointDataState extends State<PointData> {
  List<posModel> model = [];
  TextEditingController _itemid = TextEditingController();
  TextEditingController _itemname = TextEditingController();
  TextEditingController _quantity = TextEditingController();
  TextEditingController _price = TextEditingController();
  TextEditingController _rate = TextEditingController();
  TextEditingController _amount = TextEditingController();

  add() async {
    try {
      data = {
        "command": "insert into postable(name,phone,address)"
            "values('${_itemid.text}','${_itemname.text}','${_quantity.text}','${_price.text}','${_rate.text}','${_amount.text}' )"
      };
      response = await http.post(Uri.parse(setData), body: data);
    } catch (e) {
      print(e);
    }
    fetchRecords();
  }

  delete() async {
    try {
      data = {
        "command": " DELETE FROM postable where item = '${_itemname.text}'"
      };
      response = await http.post(Uri.parse(setData), body: data);
    } catch (e) {
      print(e);
    }
    fetchRecords();
  }

  update() async {
    try {
      data = {
        "command": " SELECT FROM postable where item = '${_itemname.text}'"
      };
      response = await http.post(Uri.parse(setData), body: data);
    } catch (e) {
      print(e);
    }
    fetchRecords();
  }

  // SELECT*FROM [db.table] ORDER BY id ASC;

  refresh() async {
    try {
      data = {
        "command": " SELECT FROM postable where item = '${_itemname.text}'"
      };
      response = await http.post(Uri.parse(setData), body: data);
    } catch (e) {
      print(e);
    }
    fetchRecords();
  }

  Future fetchRecords() async {
    setState(() {
      model = [];
    });
    try {
      data = {"command": "SELECT * FROM  postable"};
      http.post(Uri.parse(getData), body: data).then((http.Response response) {
        var fetchDecode = jsonDecode(response.body);
        fetchDecode.forEach((postable) {
          setState(() {
            model.add(new posModel(
              itemid: postable['itemid'],
              itemname: postable['itemname'],
              quantity: postable['quantity'],
              price: postable['price'],
              rate: postable['rate'],
              amount: postable['amount'],
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
    fetchRecords();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: ClientAppBar(userName: widget.userName,type: widget.type,),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                DataTable(
                  columns: [
                    DataColumn(label: Text('#')),
                    DataColumn(label: Text('Item')),
                    DataColumn(label: Text('Quantity')),
                    DataColumn(label: Text('Unit')),
                    DataColumn(label: Text('Rate')),
                    DataColumn(label: Text('Amount')),
                  ],
                  rows: model
                      .map((data) => DataRow(
                    cells: [
                      new DataCell(
                        Text(data.itemid),
                      ),
                      new DataCell(
                        Text(data.itemname),
                      ),
                      new DataCell(
                        Text(data.quantity),
                      ),
                      new DataCell(
                        Text(data.price),
                      ),
                      new DataCell(
                        Text(data.rate),
                      ),
                      new DataCell(
                        Text(data.amount),
                      ),
                    ],
                  ))
                      .toList(),
                ),
                SizedBox(
                  height: 50,
                ),
                textField(_itemid, width * 0.6, 40.0, false, 'Itemid'),
                SizedBox(
                  height: 30,
                ),
                textField(_itemname, width * 0.6, 40.0, false, 'Itemname'),
                SizedBox(
                  height: 30,
                ),
                textField(_quantity, width * 0.6, 40.0, false, 'Quantity'),
                SizedBox(
                  height: 30,
                ),
                textField(_price, width * 0.6, 40.0, false, 'Unit'),
                SizedBox(
                  height: 30,
                ),
                textField(_rate, width * 0.6, 40.0, false, 'Rate'),
                SizedBox(
                  height: 30,
                ),
                textField(_amount, width * 0.6, 40.0, false, 'Amount'),
                SizedBox(
                  height: 30,
                ),
                Row(children: [
                  actionButtons('Add', () {
                    add();

                    fetchRecords();
                  }, Colors.green.shade600),
                  SizedBox(
                    width: 15,
                  ),
                  actionButtons('Delete', () {
                    delete();

                    fetchRecords();
                  }, Colors.blue.shade600),
                  SizedBox(
                    width: 15,
                  ),
                  actionButtons('Update', () {
                    update();

                    fetchRecords();
                  }, Colors.blue.shade600),
                  SizedBox(
                    width: 15,
                  ),
                  actionButtons('Refresh', () {
                    refresh();

                    fetchRecords();
                  }, Colors.blue.shade600),
                ])
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: ChatButton(),
    );
  }
}