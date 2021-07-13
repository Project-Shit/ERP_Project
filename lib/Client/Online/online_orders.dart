// @dart=2.9
import 'package:erp/Client/Crm/crmmarian.dart';
import 'package:erp/Client/Online/crm.dart';
import 'package:erp/widget/appBar/clientAppBar.dart';
import 'package:erp/widget/chat/chatButton.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

class OnlineOrder extends StatefulWidget {
   final String userName;

   OnlineOrder({this.userName});

  @override
  _OnlineOrderState createState() => _OnlineOrderState();
}

class _OnlineOrderState extends State<OnlineOrder> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(width, 70),
        child: ClientAppBar(
          userName: widget.userName,
        ),
      ),

      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [

                actionButtons('Create Order', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => crmData(
                       ),
                    ),
                  );


                 }, Colors.blue.shade600),




              ],
            ),
          ),
        ),
      ),


    );
  }
}
