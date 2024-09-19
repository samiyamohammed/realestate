import 'package:flutter/material.dart';
import 'package:real_estate_marketplace/pages/account_page/Signin_page.dart';
import 'package:real_estate_marketplace/pages/account_page/signup_page.dart';

class AccountPage extends StatefulWidget {
  @override
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: DefaultTabController(
        length: 2, // Number of tabs

        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus(); // Dismisses the keyboard
          },
          child: Scaffold(
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  image: DecorationImage(
                    image: AssetImage('assets/images/favorite1.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              backgroundColor: Colors.transparent,
              bottom: PreferredSize(
                preferredSize:
                    // Size.fromHeight(200), // Adjust the height as needed
                    Size.fromHeight(
                        width * 0.488), // Adjust the height as needed
                child: Column(
                  children: [
                    // SvgPicture.asset(
                    //   'lib/assets/svg/leader.svg',
                    //   // height: 150, // Adjust the height as needed
                    //   height: width * 0.366, // Adjust the height as needed
                    //   width: double.infinity,
                    //   fit: BoxFit.cover,
                    // ),
                    TabBar(
                      controller: _tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorColor: const Color.fromARGB(
                          255, 255, 255, 255), // Set the color of the indicator
                      labelColor: const Color.fromARGB(255, 255, 255,
                          255), // Set the color of the selected tab label
                      unselectedLabelColor: Colors.blueAccent,
                      padding:
                          const EdgeInsets.symmetric(vertical: 5, horizontal: 70),
                      dividerHeight: 0,
                      tabs: const [
                        Tab(text: 'Sign Up'),
                        Tab(text: 'Sign In'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: [
                      // Your Tab 1 content goes here
                      SignUpPage(
                        tabController: _tabController,
                      ),

                      SignInPage(
                        tabController: _tabController,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 27, 0, 82), // Second color
                        // const Color.fromARGB(255, 27, 0, 82), // Second color
                        // Colors.deepPurple, // Second color
                        Colors.deepPurpleAccent, // First color
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
