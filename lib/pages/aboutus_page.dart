import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_estate_marketplace/models/aboutus_model.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go('/home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "We believe that finding a place to call home should be an exciting and stress-free experience. "
              "That's why we created [App Name], a platform designed to connect you with your ideal property. "
              "Whether you're buying, selling, or renting, we're committed to making your real estate journey smooth and successful.",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 30),
            const Text(
              'Contacts',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ...MockDataProvider.contactInfoList.map((contact) {
              return Container(
                margin: const EdgeInsets.symmetric(
                    vertical: 5.0), // Margin around each item
                padding:
                    const EdgeInsets.all(10.0), // Padding inside the container
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.0),
                  border: Border.all(
                    color: const Color.fromARGB(255, 29, 28, 28),
                    width: 1.0,
                  ),
                ),
                child: Row(
                  children: [
                    Icon(contact.icon, size: 28, color: Colors.grey[700]),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        contact.value,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              );
              // ignore: unnecessary_to_list_in_spreads
            }).toList(),
            const Spacer(),
            const Divider(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'App Version',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  MockDataProvider.appVersion,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
