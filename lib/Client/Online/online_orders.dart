import 'package:flutter/material.dart';

void main() {
  runApp(dat());
}

class dat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(

            backgroundColor: Color.fromRGBO(32, 32, 32, 1),
            title: Text(
              "Online Orders",
              style: TextStyle
                (
                fontSize: 30,

              )

              ,
            ),
          ),
          body: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You Can Create order now"),
              ],
            ),
          )),
    );
  }
}
