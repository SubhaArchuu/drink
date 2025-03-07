class ChatMessage {
  final String text;
  final bool isUser; // true = user, false = bot

  ChatMessage({required this.text, required this.isUser});
}
