import 'package:flutchat/components/message_bubble.dart';
import 'package:flutchat/core/models/chat_message.dart';
import 'package:flutchat/core/services/auth/auth_service.dart';
import 'package:flutchat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text("Sem dados. Vamos conversar?"),
          );
        } else {
          final msgs = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: msgs.length,
            itemBuilder: (ctx, i) => MessageBubble(
              key: ValueKey(msgs[i].id),
              message: msgs[i],
              belongsToMe: currentUser?.id == msgs[i].userId,
            ),
          );
        }
      },
    );
  }
}
