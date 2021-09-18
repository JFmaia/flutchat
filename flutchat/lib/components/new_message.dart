import 'package:flutchat/core/services/auth/auth_service.dart';
import 'package:flutchat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  _NewMessageState createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  String _message = "";
  final _messageController = TextEditingController();

  Future<void> _sendMenssage() async {
    final user = AuthService().currentUser;

    if (user != null) {
      await ChatService().save(_message, user);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              onChanged: (msg) => setState(() => _message = msg),
              onSubmitted: (_) {
                if (_message.trim().isNotEmpty) {
                  _sendMenssage();
                }
              },
              decoration: InputDecoration(
                labelText: 'Enviar mensagem...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(left: 10),
            icon: Icon(
              Icons.send_outlined,
              color: Theme.of(context).primaryColor,
            ),
            onPressed: _message.trim().isEmpty ? null : _sendMenssage,
          ),
        ],
      ),
    );
  }
}
