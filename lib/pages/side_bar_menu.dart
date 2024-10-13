import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_bloc.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_event.dart';
import 'package:real_estate_marketplace/bloc/theme_bloc/theme_state.dart';
import 'package:real_estate_marketplace/widgets/toggle_theme_icon.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).canvasColor,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200, // Adjust height as needed
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/city_skyline.png'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: ToggleThemeIcon(),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SizedBox(
                width: 150,
                child: ElevatedButton(
                  onPressed: () {
                    // Implement Sign In functionality
                    Navigator.pop(context);
                    context.push('/account');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.orange,
                    backgroundColor: Colors.white.withOpacity(0.8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                      side: const BorderSide(color: Colors.orange),
                    ),
                  ),
                  child: const Text('Sign In'),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const SizedBox(height: 10),
                _buildDrawerItem(Icons.settings, "Settings", () {
                  context.push('/settings');
                }, context),
                _buildDrawerItem(Icons.add_box, "Add Property", () {
                  context.push('/add_property');
                }, context),
                _buildDrawerItem(Icons.help_outline, "FAQs", () {
                  context.push('/faq');
                }, context),
                _buildDrawerItem(Icons.info_outline, "About Us", () {
                  context.push('/aboutus');
                }, context),
                _buildDrawerItem(Icons.share, "Share App", () {
                  // Implement sharing functionality here
                }, context),
                _buildDrawerItem(Icons.star_rate, "Rate App", () {
                  // Implement rate app functionality here
                }, context),
                _buildDrawerItem(Icons.support_agent, "Help and Support", () {
                  context.push('/help_support');
                }, context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
      IconData icon, String title, Function() onTap, BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      onTap: onTap,
    );
  }
}
