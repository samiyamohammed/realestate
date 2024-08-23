import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNavigation extends StatefulWidget {
  final ValueChanged<int> onItemSelected;

  const BottomNavigation({super.key, required this.onItemSelected});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      color: const Color.fromARGB(255, 91, 53, 175),
      backgroundColor: Colors.transparent,
      buttonBackgroundColor: Colors.white,
      height: 70,
      items: <Widget>[
        _buildNavItem(Icons.home, 0),
        _buildNavItem(Icons.favorite, 1),
        _buildNavItem(Icons.chat, 2),
        _buildNavItem(Icons.notifications, 3),
        _buildNavItem(Icons.person, 4),
      ],
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
          widget.onItemSelected(index);
        });
      },
    );
  }

  Widget _buildNavItem(IconData icon, int index) {
    bool isSelected = _selectedIndex == index;

    return Container(
      decoration: isSelected
          ? const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 91, 53, 175),
            )
          : null,
      padding: const EdgeInsets.all(8.0),
      child: Icon(
        icon,
        size: 30,
        color: Colors.white,
      ),
    );
  }
}
