import 'dart:async';
import 'dart:io';
import 'package:flutchat/core/models/chat_user.dart';
import 'package:flutchat/core/services/auth/auth_service.dart';

class AuthFirebaseService implements AuthService {
  static ChatUser? _currentUser;
  static MultiStreamController<ChatUser?>? _controller;
  static final _userStream = Stream<ChatUser?>.multi((controller) {
    _controller = controller;
  });

  ChatUser? get currentUser {
    return _currentUser;
  }

  Stream<ChatUser?> get userChanges {
    return _userStream;
  }

  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  ) async {}

  Future<void> login(
    String email,
    String password,
  ) async {}

  Future<void> logout() async {}
}
