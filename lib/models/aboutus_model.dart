import 'package:flutter/cupertino.dart';

class MockDataProvider {
  // Data model to represent contact information
  static final List<ContactInfo> contactInfoList = [
    ContactInfo(icon: CupertinoIcons.phone_solid, value: "+251-XXX-XXX-XXX"),
    ContactInfo(icon: CupertinoIcons.globe, value: "www.appwebsite.com"),
    ContactInfo(icon: CupertinoIcons.mail_solid, value: "appwebsite@sth.com"),
    ContactInfo(icon: CupertinoIcons.xmark_circle_fill, value: "X"),
    ContactInfo(icon: CupertinoIcons.photo_camera_solid, value: "Instagram"),
    ContactInfo(icon: CupertinoIcons.play_rectangle_fill, value: "YouTube"),
  ];

  // App version information
  static const String appVersion = "1.1.0";
}

// Contact information model
class ContactInfo {
  final IconData icon;
  final String value;

  ContactInfo({required this.icon, required this.value});
}
