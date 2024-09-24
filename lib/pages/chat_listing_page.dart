import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/BottomNavigationBloc.dart';
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import 'package:real_estate_marketplace/models/chat_listing_model.dart';
import 'package:real_estate_marketplace/models/messaging_model.dart';
import 'package:real_estate_marketplace/pages/chat_page.dart';
import 'package:real_estate_marketplace/widgets/bottom_navigation.dart';

class ChatListPage extends StatefulWidget {
  const ChatListPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<ChatListing> chatListings = [
    ChatListing(
      name: "Lara Michelson",
      lastMessage: "Okay great! See you tomorrow then.",
      profilepic: "assets/images/profile_icon.png",
      messages: [
        ChatMessage(
          message: "Okay great! See you tomorrow then.",
          isSentByMe: true,
        ),
      ],
      unreadMessagesCount: 2,
    ),
    ChatListing(
      name: "Amara Ibrahim",
      lastMessage: "I am happy I have had the privilege of . . .",
      profilepic: "assets/images/profile_icon.png",
      messages: [
        ChatMessage(
          message: "I am happy I have had the privilege of . . .",
          isSentByMe: false,
        ),
      ],
      unreadMessagesCount: 5,
    ),
  ];

  String _searchQuery = '';
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _startSearch() {
    ModalRoute.of(context)!.addLocalHistoryEntry(
      LocalHistoryEntry(onRemove: _stopSearching),
    );
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSearchQuery();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSearchQuery() {
    setState(() {
      _searchController.clear();
      _searchQuery = '';
    });
  }

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<ChatListing> filteredChats = chatListings
        .where((chat) =>
            chat.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            chat.lastMessage.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return BlocProvider(
      create: (context) => BottomNavigationBloc(),
      child: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
        builder: (context, state) {
          int selectedIndex = 2; // Default to the message index

          if (state is BottomNavigationUpdated) {
            selectedIndex = state.selectedIndex;
          }

          // ignore: no_leading_underscores_for_local_identifiers
          void _onItemTapped(int index) {
            context.read<HomeBloc>().add(HomeIndexChanged(index));

            switch (index) {
              case 0:
                context.go('/home');
                break;
              case 1:
                context.go('/favorite');
                break;
              case 2:
                break;
              case 3:
                context.go('/notifications');
                break;
              case 4:
                context.go('/profile');
                break;
            }
          }

          return Scaffold(
            appBar: AppBar(
              leading: _isSearching
                  ? const BackButton()
                  : IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        context.go('/home');
                      },
                    ),
              title: _isSearching
                  ? TextField(
                      controller: _searchController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        hintText: 'Search...',
                        border: InputBorder.none,
                      ),
                      onChanged: _updateSearchQuery,
                    )
                  : const Text("Message"),
              actions: [
                if (_isSearching)
                  IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      if (_searchController.text.isEmpty) {
                        Navigator.pop(context);
                        return;
                      }
                      _clearSearchQuery();
                    },
                  )
                else
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: _startSearch,
                  ),
              ],
            ),
            body: ListView.builder(
              itemCount: filteredChats.length,
              itemBuilder: (context, index) {
                final chat = filteredChats[index];
                return ChatListItem(
                  name: chat.name,
                  message: chat.lastMessage,
                  avatarUrl: chat.profilepic,
                  unreadMessagesCount: chat.unreadMessagesCount,
                  onTap: () {
                    setState(() {
                      chatListings = chatListings.map((c) {
                        if (c == chat) {
                          return chat.copyWith(unreadMessagesCount: 0);
                        }
                        return c;
                      }).toList();
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatPage(chatListing: chat),
                      ),
                    );
                  },
                );
              },
            ),
            bottomNavigationBar: BottomNavigation(
              currentIndex: selectedIndex,
              onItemSelected: _onItemTapped,
            ),
          );
        },
      ),
    );
  }
}

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String avatarUrl;
  final int unreadMessagesCount;
  final VoidCallback onTap;

  const ChatListItem({
    required this.name,
    required this.message,
    required this.avatarUrl,
    required this.unreadMessagesCount,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(avatarUrl),
      ),
      title: Text(name),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: unreadMessagesCount > 0
          ? CircleAvatar(
              radius: 12,
              backgroundColor: const Color.fromARGB(255, 120, 54, 244),
              child: Text(
                unreadMessagesCount.toString(),
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            )
          : null,
      onTap: onTap,
    );
  }
}
