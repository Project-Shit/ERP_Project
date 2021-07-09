// @dart=2.9

import 'package:erp/constants.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';



// ignore: camel_case_types

class ImageTest extends StatefulWidget {

  @override
  _ImageTestState createState() => _ImageTestState();
}

class _ImageTestState extends State<ImageTest> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: ClientAppBar(),
      ),
      drawer: Drawer(

        child: ChangeNotifierProvider<MyProvider>(
          create: (context) => MyProvider(),
          child: Consumer<MyProvider>(
            builder: (context,provider,child){
              return Container(
                width: 500,
                height: 600,
                child: Column(
                  children: [
                    if(provider.image!=null)
                      Image.network(provider.image.path,height: 300,),
                    IconButton(
                      icon: Icon(
                        Icons.attach_file,
                      ),
                      onPressed: () async{
                        var image = await ImagePicker().getImage(source: ImageSource.gallery);
                        provider.setImage(image);
                      },

                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),

    );
  }
}

class MyProvider extends ChangeNotifier{
  var image;

  Future setImage(img) async{
    this.image = img;
    this.notifyListeners();
  }
}
class task extends StatelessWidget {


  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(

          child: Container(
            width: double.infinity,
            margin: EdgeInsets.all(40.0),
            child: Column(children: <Widget>[
              SizedBox(
                width: 130,
              ),
              Text(
                "Create new task",
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
                          width: 2, color: Colors.black26),
                    ),
                    labelText: "Enter task name",
                    icon: Icon(Icons.add_task_outlined),
                  ),
                ),
              ),

              Container(
                child: IconButton(
                  color: Colors.black,
                  onPressed: () {

                  },

                  icon: Icon(
                    Icons.attach_file,
                    color: Colors.blue,
                  ),
                ),),


              Container(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 2, color: Colors.black26),
                    ),
                    labelText: "assign to",
                    icon: Icon(Icons.alternate_email),
                  ),

                ),

              ),
              Container(
                width: 200,
                height: 400,
                child: AlertDialog(


                ),

              ),





              OutlinedButton(
                  onPressed: null,
                  child: Text(
                    "Send",
                    style: TextStyle(color: Colors.black26),
                  )),


            ]),
          ),
        ),
        floatingActionButton: ChatButton(),

      ),
    )
    ;
  }


}

