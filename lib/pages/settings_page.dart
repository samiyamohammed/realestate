// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api, avoid_print

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isPushNotificationEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/home');
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          const ListTile(
            title: Text('Configuration',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: const Text('Language Preference'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.go('/language-preferences');
            },
          ),
          ListTile(
            title: const Text('Onboard Intro'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Onboard Intro screen
            },
          ),
          SwitchListTile(
            title: const Text('Push Notification'),
            value: _isPushNotificationEnabled,
            onChanged: (bool value) {
              setState(() {
                _isPushNotificationEnabled = value;
              });
              print('Push Notification Enabled: $value');
            },
          ),
          const ListTile(
            title: Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: const Text('Terms and Conditions'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Terms and Conditions screen
            },
          ),
          ListTile(
            title: const Text('Privacy Policy'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Privacy Policy screen
            },
          ),
        ],
      ),
    );
  }
}

class LanguagePreferencesPage extends StatelessWidget {
  final List<String> languages = [
    'English',
    'Amharic',
    'Afar',
    'Arabic',
    'Oromifa',
    'Somali',
    'Tigray',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Language Preferences'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/settings');
          },
        ),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ListTile(
                title: Text(languages[index]),
                onTap: () {
                  // Handle language selection here
                },
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
