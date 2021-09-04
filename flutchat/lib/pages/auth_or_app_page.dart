import 'package:flutchat/core/models/chat_user.dart';
import 'package:flutchat/core/services/auth/auth_mock_service.dart';
import 'package:flutchat/pages/chat_page.dart';
import 'package:flutchat/pages/loading_page.dart';
import 'package:flutter/material.dart';

import 'auth_page.dart';

class AuthOrAppPage extends StatelessWidget {
  const AuthOrAppPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ChatUser?>(
        stream: AuthMockService().userChanges,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingPage();
          } else {
            return snapshot.hasData ? ChatPage() : AuthPage();
          }
        },
      ),
    );
  }
}
