import 'package:flutchat/components/messages.dart';
import 'package:flutchat/components/new_message.dart';
import 'package:flutchat/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Flutchat",
          ),
          actions: [
            DropdownButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: [
                        Icon(
                          Icons.exit_to_app,
                          color: Colors.black87,
                        ),
                        SizedBox(width: 1),
                        Text("Sair"),
                      ],
                    ),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            )
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Messages(),
              ),
              NewMessage(),
            ],
          ),
        ));
  }
}
