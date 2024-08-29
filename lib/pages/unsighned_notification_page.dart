import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/HomeState.dart';
import 'package:real_estate_marketplace/bloc/home_bloc.dart';
import 'package:real_estate_marketplace/widgets/bottom_navigation.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(), // Provide the HomeBloc
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          int selectedIndex = 3; // Default to the notifications index

          if (state is HomeLoaded) {
            selectedIndex = state.selectedIndex;
          }

          // Function to handle navigation based on selected index
          // ignore: no_leading_underscores_for_local_identifiers
          void _onItemTapped(int index) {
            // Update the index in the Bloc
            context.read<HomeBloc>().add(HomeIndexChanged(index));

            // Navigate to the appropriate page based on the selected index
            switch (index) {
              case 0:
                context.go('/home'); // Navigate to Home Page
                break;
              case 1:
                context.go('/favorite'); // Navigate to Favorite Page
                break;
              case 2:
                context.go('/chat'); // Navigate to Chat Page
                break;
              case 3:
                // Stay on the Notification page
                break;
              case 4:
                context.go('/profile'); // Navigate to Profile Page
                break;
            }
          }

          return Scaffold(
            appBar: AppBar(
              title: const Text("Notifications"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  context.go('/home');
                },
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.notifications_none,
                      size: 100,
                      color: Colors.black,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Get notified about properties\nof your choice",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Never miss a price drop—stay informed with instant alerts.",
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
                        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
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
