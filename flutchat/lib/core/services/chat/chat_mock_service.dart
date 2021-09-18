import 'dart:async';
import 'dart:math';

import 'package:flutchat/core/models/chat_message.dart';
import 'package:flutchat/core/models/chat_user.dart';

import 'chat_service.dart';

class ChatMockService implements ChatService {
  static final List<ChatMessage> _msgs = [];
  static MultiStreamController<List<ChatMessage>>? _controller;
  static final _msgsStream = Stream<List<ChatMessage>>.multi(
    (controller) {
      _controller = controller;
      controller.add(_msgs);
    },
  );

  Stream<List<ChatMessage>> messagesStream() {
    return _msgsStream;
  }

  Future<ChatMessage> save(String text, ChatUser user) async {
    final newMessage = ChatMessage(
      id: Random().nextDouble().toString(),
      text: text,
      createdAt: DateTime.now(),
      userId: user.id,
      userName: user.name,
      userImageURL: user.imageUrl,
    );

    //Adicionando menssagem na lista.
    _msgs.add(newMessage);
    //Adicionando a lista de menssagens para a Stream.
    _controller!.add(_msgs.reversed.toList());

    return newMessage;
  }
}
