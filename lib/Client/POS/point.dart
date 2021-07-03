import 'package:flutter/material.dart';

void main(){
  runApp(posd());

}

class posd extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
          title: Text("POS"),

        ),

      ),

    );

  }


}


