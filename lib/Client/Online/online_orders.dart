// @dart=2.9
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

                      Text("Customer Info",style:TextStyle(
                        fontSize: 30,


                      )
                        ,),
                      SizedBox(width: 120,),
                      SizedBox(width: 120,),


                      Container(
                        child: TextField(
                          decoration: InputDecoration(
                            enabledBorder : OutlineInputBorder(
                            borderSide: BorderSide(width: 2 , color: Color.fromRGBO(32, 32, 32, 1)),

                            ),
                            labelText: "Enter Customer Phone Number",
                            icon: Icon(Icons.phone),
                          ),



                        ),


                      ),
                      OutlinedButton(onPressed: null ,

                          child: Text("Next",
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
