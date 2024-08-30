import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PropertiesTabBar extends StatelessWidget {
  final bool isDraftSelected;

  const PropertiesTabBar({required this.isDraftSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            if (isDraftSelected) {
              context.go('/posted-properties');
            }
          },
          child: Column(
            children: [
              Text(
                'My Properties',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight:
                      isDraftSelected ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              Container(
                height: 2,
                width: 100,
                color: isDraftSelected
                    ? Colors.transparent
                    : const Color.fromARGB(255, 43, 42, 43),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if (!isDraftSelected) {
              context.go('/draft-properties');
            }
          },
          child: Column(
            children: [
              Text(
                'Draft Properties',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight:
                      isDraftSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              Container(
                height: 2,
                width: 100,
                color: isDraftSelected ? const Color.fromARGB(255, 43, 42, 43) : Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
