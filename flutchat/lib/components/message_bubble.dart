import 'dart:io';

import 'package:flutchat/core/models/chat_message.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  static const _defaultImage = 'assets/images/avatar.png';
  final ChatMessage message;
  final bool belongsToMe;
  const MessageBubble({
    Key? key,
    required this.message,
    required this.belongsToMe,
  }) : super(key: key);

  Widget _showUserImage(String imageURL) {
    ImageProvider? provider;
    final uri = Uri.parse(imageURL);

    if (uri.path.contains(_defaultImage)) {
      provider = AssetImage(_defaultImage);
    } else if (uri.scheme.contains('http')) {
      provider = NetworkImage(
        uri.toString(),
      );
    } else {
      provider = FileImage(
        File(
          uri.toString(),
        ),
      );
    }
    return CircleAvatar(
      backgroundImage: provider,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              belongsToMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            Container(
              width: mediaQuery.width * 0.42,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 8,
              ),
              decoration: BoxDecoration(
                color: belongsToMe
                    ? Colors.grey.shade300
                    : Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft:
                      belongsToMe ? Radius.circular(12) : Radius.circular(0),
                  bottomRight:
                      belongsToMe ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: belongsToMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    message.userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: belongsToMe ? Colors.black : Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    message.text,
                    textAlign: belongsToMe ? TextAlign.end : TextAlign.start,
                    style: TextStyle(
                      color: belongsToMe ? Colors.black : Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: belongsToMe ? null : mediaQuery.width * 0.38,
          right: belongsToMe ? mediaQuery.width * 0.38 : null,
          child: _showUserImage(message.userImageURL),
        ),
      ],
    );
  }
}
