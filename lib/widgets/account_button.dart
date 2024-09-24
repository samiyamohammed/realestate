import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  const AccountButton(
      {super.key, required this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              side: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: const Color.fromARGB(255, 173, 157, 247),
            ),
          ),
        ),
      ),
    );
  }
}
