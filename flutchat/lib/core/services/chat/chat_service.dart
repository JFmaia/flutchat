import 'package:flutchat/core/models/chat_message.dart';
import 'package:flutchat/core/models/chat_user.dart';
import 'package:flutchat/core/services/chat/chat_firebase_service.dart';

abstract class ChatService {
  Stream<List<ChatMessage>> messagesStream();

  Future<ChatMessage?> save(String text, ChatUser user);

  factory ChatService() {
    return ChatFirebaseService();
  }
}
