import 'package:flutter/material.dart';

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
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
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
              // Navigate to Language Preference screen
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
