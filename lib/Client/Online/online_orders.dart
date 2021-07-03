import 'package:flutter/material.dart';

void main(){
  runApp(dat());

}

class dat extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar:AppBar(
            title: Text("Online Orders"),

        ),

      ),

    );

  }


}


