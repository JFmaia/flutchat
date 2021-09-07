class ChatMessage {
  //Atributos unicos da menssagem.
  final String id;
  final String text;
  final DateTime createdAt;
  // Atributos que no ChatUser tbm exitem.
  final String userId;
  final String userName;
  final String userImageURL;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.createdAt,
    required this.userId,
    required this.userName,
    required this.userImageURL,
  });
}
