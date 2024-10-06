import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EmptyPropertyCard extends StatelessWidget {
  final String title;
  const EmptyPropertyCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/construction.svg',
            width: 60,
            color: Colors.grey,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(title, style: const TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    );
  }
}
