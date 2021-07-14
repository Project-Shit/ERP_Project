// @dart=2.9
import 'package:erp/Client/chatapp/models/message.dart';
import 'package:erp/Client/chatapp/widgets/users_card.dart';
import 'package:flutter/material.dart';
import 'custom_chat_buble.dart';
import 'footer.dart';
import 'package:provider/provider.dart';
import 'package:erp/Client/chatapp/providers/auth.dart';

class ChatBox extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    final messages = Provider.of<List<MessageModel>>(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                width: 300,
                child: UsersCardWidget(
                  userModel: authProvider.userModel,
                )),
            SizedBox(
              width: 100,
            ),
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {},
            )
          ],
        ),
        Divider(),
        Expanded(
          child: ListView.builder(
            reverse: true,
            itemCount: messages?.length ?? 0,
            itemBuilder: (_, index) {
              MessageModel message = messages[index];
              return CustomChatBubble(
                isMe: message.senderId == authProvider.userModel.id,
                text: message.content,
                user: message.senderName,
              );
            },
          ),
        ),
        Divider(),
        Footer()
      ],
    );
  }
}