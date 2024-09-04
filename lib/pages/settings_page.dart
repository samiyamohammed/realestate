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
        title: Text('Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/home');
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('Configuration',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Language Preference'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              context.go('/language-preferences');
            },
          ),
          ListTile(
            title: Text('Onboard Intro'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Onboard Intro screen
            },
          ),
          SwitchListTile(
            title: Text('Push Notification'),
            value: _isPushNotificationEnabled,
            onChanged: (bool value) {
              setState(() {
                _isPushNotificationEnabled = value;
              });
              print('Push Notification Enabled: $value');
            },
          ),
          ListTile(
            title: Text('About', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          ListTile(
            title: Text('Terms and Conditions'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to Terms and Conditions screen
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios),
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
        title: Text('Language Preferences'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
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
              Divider(),
            ],
          );
        },
      ),
    );
  }
}
