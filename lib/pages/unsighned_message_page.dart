import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/BottomNavigationBloc.dart';
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import 'package:real_estate_marketplace/widgets/bottom_navigation.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                context.go('/home'); // Navigate to Home Page
                break;
              case 1:
                context.go('/favorite'); // Navigate to Favorite Page
                break;
              case 2:
                // Current page, no navigation needed
                break;
              case 3:
                context.go('/notifications'); // Navigate to Notification Page
                break;
              case 4:
                context.go('/profile'); // Navigate to Profile Page
                break;
            }
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text("Message"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  // Use GoRouter to navigate to the Home page
                  context.go('/home');
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.message_outlined,
                    size: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Stay in touch with instant messages.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Stay connected with instant messaging alerts.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Add your logic here for when the "Join" button is pressed
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 80, vertical: 15),
                      backgroundColor: const Color.fromARGB(255, 91, 53, 175),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      "Join",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigation(
              currentIndex: selectedIndex, // Pass the current selected index
              onItemSelected: _onItemTapped, // Pass the onTap function
            ),
          );
        },
      ),
    );
  }
}
