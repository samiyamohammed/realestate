// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> onboardingData = [
    {
      'title': 'Find Your Dream Home or Investment Opportunity',
      'subtitle':
          'Whether you are looking for a home to live in or a commercial property to invest in, we help you discover the perfect match.',
      'animation': 'assets/Deal.json'
    },
    {
      'title': 'Know Your Neighborhood',
      'subtitle':
          'Get comprehensive information about nearby schools, religious places, and other amenities to make an informed decision.',
      'animation': 'assets/schooll.json'
    },
    {
      'title': 'List Your Property with Ease',
      'subtitle':
          'Ready to sell or rent? Add your property in just a few steps and start reaching potential buyers or renters.',
      'animation': 'assets/edited_invest_animation.json'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                    });
                  },
                  itemCount: onboardingData.length,
                  itemBuilder: (context, index) {
                    return OnboardingContent(
                      title: onboardingData[index]['title']!,
                      subtitle: onboardingData[index]['subtitle']!,
                      animation: onboardingData[index]['animation']!,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => statIndicator(index),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        currentPage == 0
                            ? const SizedBox(width: 48)
                            : IconButton(
                                icon: const Icon(
                                  Icons.arrow_back_ios_new_rounded,
                                  color: Color.fromARGB(255, 91, 53, 175),
                                ),
                                onPressed: () {
                                  _pageController.previousPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                              ),
                        currentPage == 2
                            ? TextButton(
                                onPressed: () {
                                  setOnboardingCompleted(context);
                                },
                                child: const Text(
                                  'Done',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 91, 53, 175),
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              )
                            : IconButton(
                                icon: const Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  color: Color.fromARGB(255, 91, 53, 175),
                                ),
                                onPressed: () {
                                  _pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn,
                                  );
                                },
                              ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: currentPage == 2
                ? const SizedBox(width: 48)
                : TextButton(
                    onPressed: () {
                      setOnboardingCompleted(context);
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 91, 15, 255),
                          decoration: TextDecoration.underline),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Future<void> setOnboardingCompleted(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboardingCompleted', true);
    if (mounted) {
      // ignore: avoid_print
      print('Navigating to home page');
      GoRouter.of(context).go('/home');
    }
  }

  // page indicator widget
  Widget statIndicator(int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: currentPage == index ? 46 : 42,
      height: 7,
      decoration: BoxDecoration(
        color: currentPage == index
            ? const Color.fromARGB(255, 91, 53, 175)
            : const Color.fromARGB(255, 191, 168, 240),
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}

class OnboardingContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final String animation;

  const OnboardingContent({
    super.key,
    required this.title,
    required this.subtitle,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 90),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 90),
          Lottie.asset(animation, height: 250),
          const SizedBox(height: 50),
          Flexible(
            child: Text(
              subtitle,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
