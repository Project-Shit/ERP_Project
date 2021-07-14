// @dart=2.9
import 'package:erp/Client/chatapp/widgets/chat_box.dart';

import 'package:erp/Client/chatapp/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import '../widgets/chat_box.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(222, 229, 238, 1),
      body: Row(
        children: [
          SideMenu(),
          Expanded(
            child: ChatBox(),
          )
        ],
      ),
    );
  }
}
