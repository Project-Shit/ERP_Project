// @dart=2.9
import 'package:erp/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';





void main(){
runApp(OnlineOrder());

}
class OnlineOrder extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return OnlineOrderState();
  }

}

class OnlineOrderState extends State<OnlineOrder>{
  final _test = TextEditingController();




  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromRGBO(32, 32, 32, 1),
            title: Text(
              "Online Orders",
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          body: Container(
            width: double.infinity,
            margin: EdgeInsets.all(40.0),
            child: Column(children: <Widget>[
              SizedBox(
                width: 120,
              ),
              Text(
                "Customer Info",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                width: 120,
              ),
              SizedBox(
                width: 120,
              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromRGBO(32, 32, 32, 1)),
                    ),
                    labelText: "Enter Customer Phone Number",
                    icon: Icon(Icons.phone),
                  ),
                ),


              ),
              Container(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Color.fromRGBO(32, 32, 32, 1)),
                    ),
                    labelText: "Name",
                    icon: Icon(Icons.person),
                  ),
                ),





              ),

            textField(_test, 250, 60.0, true),




              OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "Next",
                    style: TextStyle(color: Color.fromRGBO(32, 32, 32, 1)),
                  )),
            ]),
          )),
    );
  }
}
