import 'package:flutter/material.dart';

class DateDifferenceCalculator {
  static int daysBetween(DateTime from) {
    from = DateTime(from.year, from.month, from.day);
    DateTime to = DateTime.now();
    return (to.difference(from).inHours / 24).round();
  }
}
