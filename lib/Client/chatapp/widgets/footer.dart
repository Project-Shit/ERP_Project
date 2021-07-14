import 'package:flutter/material.dart';
import 'package:erp/Client/chatapp/providers/auth.dart';
import 'package:erp/Client/chatapp/providers/messages.dart';
import 'package:provider/provider.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    MessagesProvider messagesProvider = Provider.of<MessagesProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.3),
                        offset: Offset(2, 3),
                        blurRadius: 7)
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextField(
                  onSubmitted: (value){
                    messagesProvider.sendMessage(sender: authProvider.userModel);
                  },
                  controller: messagesProvider.messageController,
                  decoration: InputDecoration(
                      hintText: "Type a message", border: InputBorder.none),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.3),
                      offset: Offset(2, 3),
                      blurRadius: 7)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: IconButton(
                onPressed: () {
                 messagesProvider.sendMessage(sender: authProvider.userModel);
                },
                icon: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
