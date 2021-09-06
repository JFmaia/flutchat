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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Olá User"),
            TextButton(
              child: Text("Logout"),
              onPressed: () {
                AuthService().logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
