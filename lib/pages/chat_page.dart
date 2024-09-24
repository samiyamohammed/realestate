import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate_marketplace/bloc/messaging_bloc.dart';
import 'package:real_estate_marketplace/models/chat_listing_model.dart';

class ChatPage extends StatelessWidget {
  final ChatListing chatListing;

  const ChatPage({super.key, required this.chatListing});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatBloc(),
      child: ChatPageContent(chatListing: chatListing),
    );
  }
}

class ChatPageContent extends StatefulWidget {
  final ChatListing chatListing;

  const ChatPageContent({super.key, required this.chatListing});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageContentState createState() => _ChatPageContentState();
}

class _ChatPageContentState extends State<ChatPageContent> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool _isSearching = false;
  String _searchQuery = '';

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      context.read<ChatBloc>().add(SendMessage(text));
      _controller.clear();
      // Ensure the scroll position is adjusted to the bottom when a new message is sent
      Future.delayed(const Duration(milliseconds: 100), () {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      });
    }
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching;
      if (!_isSearching) {
        _searchQuery = '';
      }
    });
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: _isSearching
            ? TextField(
                autofocus: true,
                onChanged: _updateSearchQuery,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  border: InputBorder.none,
                ),
              )
            : Row(
                children: [
                  const CircleAvatar(
                    backgroundImage:
                        AssetImage("assets/images/profile_icon.png"),
                  ),
                  const SizedBox(width: 8),
                  Text(widget.chatListing.name),
                ],
              ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search),
            onPressed: _toggleSearch,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                final filteredMessages = state.messages.where((message) {
                  return message.message
                      .toLowerCase()
                      .contains(_searchQuery.toLowerCase());
                }).toList();

                return ListView.builder(
                  controller: _scrollController,
                  reverse:
                      true, // Keep this true to show the latest message at the bottom
                  itemCount: filteredMessages.length,
                  itemBuilder: (context, index) {
                    // Adjust the index to get the correct message order
                    final message =
                        filteredMessages[filteredMessages.length - 1 - index];
                    return Align(
                      alignment: message.isSentByMe
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 8.0),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 14.0),
                        decoration: BoxDecoration(
                          color: message.isSentByMe
                              ? Colors.grey[300]
                              : Colors.blue[100],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(message.message),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration.collapsed(
                      hintText: "Message...",
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
