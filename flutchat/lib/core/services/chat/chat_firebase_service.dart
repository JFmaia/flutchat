import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutchat/core/models/chat_message.dart';
import 'package:flutchat/core/models/chat_user.dart';

import 'chat_service.dart';

class ChatFirebaseService implements ChatService {
  Stream<List<ChatMessage>> messagesStream() {
    return Stream<List<ChatMessage>>.empty();
  }

  Future<ChatMessage?> save(String text, ChatUser user) async {
    final store = FirebaseFirestore.instance;

    // ChatMessage => Map<String, dynamic>
    final docRef = await store.collection('chat').add(
      {
        'text': text,
        'createdAt': DateTime.now().toIso8601String(),
        'userId': user.id,
        'userName': user.name,
        'userImageURL': user.imageUrl,
      },
    );

    final doc = await docRef.get();
    final data = doc.data()!;
    // Map<String, dynamic> => ChatMessage

    return ChatMessage(
      id: doc.id,
      text: data['text'],
      createdAt: DateTime.parse(data['createdAt']),
      userId: data['userId'],
      userName: data['userName'],
      userImageURL: data['userImageURL'],
    );
  }
}
