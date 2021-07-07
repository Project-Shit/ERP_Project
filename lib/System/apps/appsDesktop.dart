// @dart=2.9
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class ImageTest extends StatefulWidget {

  @override
  _ImageTestState createState() => _ImageTestState();
}

class _ImageTestState extends State<ImageTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<MyProvider>(
        create: (context) => MyProvider(),
        child: Consumer<MyProvider>(
          builder: (context,provider,child){
            return Container(
              width: 500,
              height: 600,
              child: Column(
                children: [
                  if(provider.image!=null)
                    Image.network(provider.image.path,height: 200,),
                  MaterialButton(
                    onPressed: () async{
                      var image = await ImagePicker().getImage(source: ImageSource.gallery);
                      provider.setImage(image);
                    },
                    child: Text('Get Image'),
                  ),
                ],
              ),
            );
          },
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