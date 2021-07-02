import 'package:flutter/cupertino.dart';
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
                fontSize: 40,

              )

              ,
            ),
          ),
          body: Container(
            child: Column(

                    children: <Widget>
                    [

                      SizedBox(width: 120,),

                      Text("Order Data",style:TextStyle(
                        fontSize: 30,


                      )
                        ,),
                      SizedBox(width: 120,),
                      SizedBox(width: 120,),


                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            labelText: "Enter Customer Phone Number",

                          ),



                        ),


                      ),
                      OutlinedButton(onPressed: null ,

                          child: Text("Create Order",
                            style: TextStyle(color: Color.fromRGBO(32, 32, 32, 1)
                            ),
                          )
                      ),


                    ]


            ),


          )



      ),
    );
  }
}
