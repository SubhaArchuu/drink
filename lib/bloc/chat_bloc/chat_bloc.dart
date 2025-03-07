import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  final String message;
  SendMessage(this.message);
}

class ChatState {
  final List<String> messages;
  ChatState(this.messages);
}

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState([])) {
    on<SendMessage>((event, emit) {
      List<String> updatedMessages = List.from(state.messages)
        ..add("User: ${event.message}")
        ..add("Bot: ${getBotResponse(event.message)}");
      emit(ChatState(updatedMessages));
    });
  }

  String getBotResponse(String message) {
    if (message.contains("help")) {
      return "Sure! How can I help you with reducing alcohol consumption?";
    } else {
      return "I’m here to assist! Type 'help' to get started.";
    }
  }
}
