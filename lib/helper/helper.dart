import 'package:flutter/material.dart';

class Helper {
  static int leftDays(String startDate) {
    DateTime _starDate = DateTime.parse(startDate);
    var fromDayDate = DateTime.now();
    var different = _starDate.difference(fromDayDate).inDays;

    return different;
  }
}
