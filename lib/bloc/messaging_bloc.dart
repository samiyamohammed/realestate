import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/models/messaging_model.dart';

class ChatState {
  final List<ChatMessage> messages;

  ChatState({required this.messages});
}

abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  final String message;

  SendMessage(this.message);
}

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState(messages: [])) {
    on<SendMessage>((event, emit) {
      final newMessage = ChatMessage(message: event.message, isSentByMe: true);
      emit(ChatState(messages: List.from(state.messages)..add(newMessage)));
    });
  }
}
