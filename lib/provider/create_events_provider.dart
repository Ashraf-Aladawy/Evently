import 'package:flutter/material.dart';

class CreateEventsProvider extends ChangeNotifier {
  int currentcatigor = 0;
  var selectedDate = DateTime.now();
  var selectedTime = TimeOfDay.now();
  List<String> categories = [
    "Birthday",
    "Meeting",
    "Sport",
    "Holiday",
    "Work Shop",
    "Exhibition",
    "Eating",
  ];
  void changeEventType(int index) {
    currentcatigor = index;
    notifyListeners();
  }

  void changeSelectedDay(DateTime date) {
    selectedDate = date;
    notifyListeners();
  }

  void changeSelectedTime(TimeOfDay time) {
    selectedTime = time;
    notifyListeners();
  }
}
