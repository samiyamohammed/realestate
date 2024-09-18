import 'package:real_estate_marketplace/models/messaging_model.dart';

class ChatListing {
  final String name;
  final String lastMessage;
  final String profilepic;
  final List<ChatMessage> messages;
  final int unreadMessagesCount;

  ChatListing({
    required this.name,
    required this.lastMessage,
    required this.profilepic,
    required this.messages,
    this.unreadMessagesCount = 0,
  });

  ChatListing copyWith({
    String? name,
    String? lastMessage,
    String? profilepic,
    List<ChatMessage>? messages,
    int? unreadMessagesCount,
  }) {
    return ChatListing(
      name: name ?? this.name,
      lastMessage: lastMessage ?? this.lastMessage,
      profilepic: profilepic ?? this.profilepic,
      messages: messages ?? this.messages,
      unreadMessagesCount: unreadMessagesCount ?? this.unreadMessagesCount,
    );
  }
}
