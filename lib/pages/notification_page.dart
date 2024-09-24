import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_add_outlined),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 147, 198, 241),
            ),
            child: ListTile(
              selectedTileColor: Colors.red,
              onTap: () {},
              leading: const Icon(Icons.maps_home_work_outlined),
              title: Text("New Listing in $index"),
              subtitle: const Text(
                  "This is a notification This is a notificationThis is a notification This is a notificationThis is a notification"),
              trailing: const Text('2 hours', textAlign: TextAlign.start),
            ),
          );
        },
      ),
    );
  }
}
