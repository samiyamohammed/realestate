import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'favorites properties',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        child: Container(
          margin: EdgeInsets.all(30),
          height: 270,
          decoration: BoxDecoration(
              color: Colors.grey, borderRadius: BorderRadius.circular(10)),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.all(Radius.circular(30)),
          // ),
          // decoration: const BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage(
          //         'assets/images/favorite1.png'), // Path to the image asset
          //     fit: BoxFit.fill, // How the image should fit within the container
          //   ),
          // ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 150,
                // width: 200,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/favorite1.png'), // Path to the image asset
                    fit: BoxFit
                        .cover, // How the image should fit within the container
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('For Rent'),
                    Spacer(),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    Icon(
                      Icons.share,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Column(
                      children: [
                        Text("Name of property"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_outlined),
                            Text("Qirqos")
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money_rounded),
                            Text("34,000,000 ETB")
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text("Last 1 day ago"),
                        Row(
                          children: [
                            Icon(Icons.attach_money_rounded),
                            Text("34,000,000 ETB")
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
