import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/posted%20properties/draft_properties_bloc.dart';
import 'package:real_estate_marketplace/widgets/vertical_listing.dart';
import 'package:real_estate_marketplace/widgets/properties_tab_bar.dart'; // Import the tab bar widget

class DraftPropertiesPage extends StatelessWidget {
  const DraftPropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DraftPropertiesBloc()..add(FetchDraftProperties()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Properties'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.go('/home');
            },
          ),
        ),
        body: Column(
          children: [
            const PropertiesTabBar(
                isDraftSelected: true), // Use the tab bar widget
            const Divider(height: 1, color: Colors.grey), // Divider line
            Expanded(
              child: BlocBuilder<DraftPropertiesBloc, DraftPropertiesState>(
                builder: (context, state) {
                  if (state is DraftPropertiesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is DraftPropertiesLoaded) {
                    if (state.properties.isEmpty) {
                      return const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 80,
                              color: Colors.black54,
                            ),
                            SizedBox(height: 16),
                            Text(
                              'You Have No Draft Properties',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return ListView.builder(
                        itemCount: state.properties.length,
                        itemBuilder: (context, index) {
                          return PropertyCard(
                              property: state.properties[index]);
                        },
                      );
                    }
                  } else if (state is DraftPropertiesError) {
                    return Center(child: Text(state.message));
                  } else {
                    return const Center(child: Text('An error occurred.'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
