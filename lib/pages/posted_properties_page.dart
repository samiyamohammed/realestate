import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/posted%20properties/posted_properties_bloc.dart';
import 'package:real_estate_marketplace/widgets/properties_tab_bar.dart';
import 'package:real_estate_marketplace/widgets/vertical_listing.dart';

class PostedPropertiesPage extends StatelessWidget {
  const PostedPropertiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostedPropertiesBloc()..add(FetchPostedProperties()),
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
                isDraftSelected: false), // Use the tab bar widget
            const Divider(height: 1, color: Colors.grey), // Divider line
            Expanded(
              child: BlocBuilder<PostedPropertiesBloc, PostedPropertiesState>(
                builder: (context, state) {
                  if (state is PostedPropertiesLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PostedPropertiesLoaded) {
                    if (state.properties.isEmpty) {
                      return const Center(
                        child: Text('No properties available.'),
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
                  } else if (state is PostedPropertiesError) {
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
