import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: Colors.grey[200],
  primaryColor: Color(0xff5B15A0),
  canvasColor: Colors.white,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.25,
      color: Colors.black87, // Custom font color
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 45,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: Colors.black87, // Custom font color
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 36,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: Colors.black87, // Custom font color
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25,
      color: Colors.black, // Custom font color
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: Colors.black, // Custom font color
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.black, // Custom font color
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 22,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.black87, // Custom font color
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.black87, // Custom font color
    ),
    titleSmall: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Colors.black87, // Custom font color
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Colors.grey[800], // Custom font color
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.grey[800], // Custom font color
    ),
    bodySmall: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: Colors.grey[700], // Custom font color
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Colors.blueGrey[900], // Custom font color
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: Colors.blueGrey[900], // Custom font color
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: Colors.blueGrey[800], // Custom font color
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  primaryColor: Color(0xff5B15A0),
  canvasColor: Colors.black,
  scaffoldBackgroundColor: Colors.grey[900],
  textTheme: TextTheme(
    displayLarge: GoogleFonts.poppins(
      fontSize: 57,
      fontWeight: FontWeight.bold,
      letterSpacing: -0.25,
      color: Colors.white, // Lighter color for dark background
    ),
    displayMedium: GoogleFonts.poppins(
      fontSize: 45,
      fontWeight: FontWeight.w600,
      letterSpacing: 0,
      color: Colors.white, // Lighter color for dark background
    ),
    displaySmall: GoogleFonts.poppins(
      fontSize: 36,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: Colors.white, // Lighter color for dark background
    ),
    headlineLarge: GoogleFonts.poppins(
      fontSize: 32,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.25,
      color: Colors.white70, // Slightly softer white
    ),
    headlineMedium: GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      letterSpacing: 0,
      color: Colors.white70, // Slightly softer white
    ),
    headlineSmall: GoogleFonts.poppins(
      fontSize: 24,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.white70, // Slightly softer white
    ),
    titleLarge: GoogleFonts.openSans(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      letterSpacing: 0.15,
      color: Colors.white, // Lighter color for dark background
    ),
    titleMedium: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.white, // Lighter color for dark background
    ),
    titleSmall: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Colors.white70, // Slightly softer white
    ),
    bodyLarge: GoogleFonts.openSans(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: Colors.grey[300], // Softer grey for readability
    ),
    bodyMedium: GoogleFonts.openSans(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: Colors.grey[300], // Softer grey for readability
    ),
    bodySmall: GoogleFonts.openSans(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: Colors.grey[400], // Lighter grey for small text
    ),
    labelLarge: GoogleFonts.poppins(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: Colors.blueGrey[100], // Softer light blue-grey
    ),
    labelMedium: GoogleFonts.poppins(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: Colors.blueGrey[200], // Softer light blue-grey
    ),
    labelSmall: GoogleFonts.poppins(
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: Colors.blueGrey[200], // Softer light blue-grey
    ),
  ),
);
