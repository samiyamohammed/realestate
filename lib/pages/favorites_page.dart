import 'package:flutter/material.dart';
import 'package:real_estate_marketplace/samples/favorite_sample.dart';
import 'package:real_estate_marketplace/models/favorite_model.dart';
import 'package:real_estate_marketplace/utility/date_difference_calculator.dart';

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
      body: ListView.builder(
          itemCount: 1,
          // itemCount: sampleHouses.length,
          itemBuilder: (context, index) {
            final house = sampleHouses[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 15),
                padding: const EdgeInsets.only(bottom: 5),
                // height: 240,
                // height: 250,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    // color: Colors.grey,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      height: 150,
                      // width: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/favorite1.png'), // Path to the image asset
                          fit: BoxFit
                              .cover, // How the image should fit within the container
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20), // Adjust padding as needed
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors
                                  .white, // Set the background color to white
                            ),
                            child: Text('For ${house.sellOrRent}'),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                house.houseName,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.location_on_outlined),
                                  Text(
                                    house.location,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.attach_money_rounded),
                                  Text(
                                    house.price.toString(),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Listed ${DateDifferenceCalculator.daysBetween(house.postedDate)} days ago',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                const SizedBox(
                                  height: 38,
                                ),
                                const Text(
                                  "See Details",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
