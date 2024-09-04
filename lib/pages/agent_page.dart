import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:real_estate_marketplace/models/properties_list_model.dart';
import 'package:real_estate_marketplace/widgets/property_card.dart';

class AgentPage extends StatelessWidget {
  const AgentPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Property> filteredProperties = properties;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        // padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Circular image
                  const CircleAvatar(
                    radius: 30, // Adjust the size of the image
                    backgroundImage: AssetImage(
                        'assets/images/agent.jpg'), // Replace with your image path
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Claus Michelson'),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            'Verified Agent',
                            style: TextStyle(fontSize: 10),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.verified,
                            size: 10,
                            color: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(width: 16), // Space between text and buttons
                  CircularIconButton(
                      color: const Color.fromARGB(255, 106, 234, 111),
                      icon: Icons.phone_disabled_rounded,
                      onPressed: () {}),
                  const SizedBox(width: 8), // Space between buttons
                  CircularIconButton(
                      color: Colors.yellow,
                      icon: Icons.email,
                      onPressed: () {}),
                  const SizedBox(width: 8), // Space between buttons
                  CircularIconButton(
                      color: Colors.blue,
                      icon: Icons.message_rounded,
                      onPressed: () {}),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    height: 110,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.red,
                    ),
                    child: const Text(
                      'A bit Description like a bio. About the agent',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '+251-###-####',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Agentnname@smt.com',
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(00),
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: CircularPercentIndicator(
                            radius: 30.0,
                            lineWidth: 7.0,
                            animation: true,
                            percent: 0.75,
                            center: const Text(
                              "75.0%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0,
                                  color: Color.fromARGB(255, 0, 143, 238)),
                            ),
                            // footer: const Text(
                            //   'Success',
                            //   style:
                            //       TextStyle(decoration: TextDecoration.underline),
                            // ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor:
                                const Color.fromARGB(255, 0, 143, 238),
                          ),
                        ),
                        const Text(
                          'Success',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 120,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(00),
                      border: Border.all(color: Colors.black, width: 1),
                      color: Colors.white,
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '12',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          'Posts',
                          style:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Properties listed by agent',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // For Rent Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 8),
                child: Text(
                  'For Rent',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ),
            SizedBox(
              height: 165,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredProperties
                    .where((property) => property.status == 'For Rent')
                    .length,
                itemBuilder: (context, index) {
                  final rentProperties = filteredProperties
                      .where((property) => property.status == 'For Rent')
                      .toList();
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: PropertyCard(
                      property: rentProperties[index],
                      showStatusTag:
                          false, // Hide status tag in For Rent section
                    ),
                  );
                },
              ),
            ),

            // For Sale Section
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20.0, bottom: 8, top: 8),
                child: Text(
                  'For Sale',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ),
            SizedBox(
              height: 165,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredProperties
                    .where((property) => property.status == 'For Sale')
                    .length,
                itemBuilder: (context, index) {
                  final saleProperties = filteredProperties
                      .where((property) => property.status == 'For Sale')
                      .toList();
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: PropertyCard(
                      property: saleProperties[index],
                      showStatusTag:
                          false, // Hide status tag in For Sale section
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final Color color;

  CircularIconButton(
      {required this.color, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40, // Adjust the size of the circular button
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color, // Background color of the button
      ),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.black,
          // size: 30,
        ), // Icon color
        onPressed: onPressed,
      ),
    );
  }
}
