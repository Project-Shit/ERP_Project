// @dart=2.9
import 'package:erp/Client/chatapp/providers/user.dart';
import 'package:erp/Client/chatapp/widgets/side_headers.dart';
import 'package:erp/Client/chatapp/widgets/users_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    return  Container(
      width: 400,
      decoration: BoxDecoration(
        boxShadow: [
          // BoxShadow(
          //     color: Colors.grey.withOpacity(.3),
          //     offset: Offset(2, 3),
          //     blurRadius: 3
          // )
        ],
        color: Color.fromRGBO(245, 247, 251, 1),
      ),
      child: Column(
        children: [
          SizedBox(height: 20,),
          SizedBox(
              width: 180,
              child: Image.asset("assets/images/logo2.png")),
          SideHeaders(
            text: "Online Users",
          ),
          UsersCardWidget(isOnline: true,),
          UsersCardWidget(isOnline: true,),

          SideHeaders(
            text: "All Users",
          ),
          Expanded(
            child: Column(
              children: userProvider.users.
              map((user) => UsersCardWidget(userModel: user,)
            ).toList(),
          )
          // UsersCardWidget(isOnline: false,),
          // UsersCardWidget(isOnline: false,),
          // UsersCardWidget(isOnline: false,),
          // UsersCardWidget(isOnline: false,),
          // UsersCardWidget(isOnline: false,),
          // UsersCardWidget(isOnline: false,),
          ),],
      ),
    )
    ;
  }
}
