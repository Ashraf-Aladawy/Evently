
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.light;
  int currentIndex = 0;
  int currentcatigor = 0;
  String category="";
  List<String> categories = [
    "All",
    "Birthday",
    "Meeting",
    "Sport",
    "Holiday",
    "Work Shop",
    "Exhibition",
    "Eating",
  ];

   void changeTheme(){
    if(themeMode==ThemeMode.light){
      themeMode=ThemeMode.dark;
    }else{
      themeMode=ThemeMode.light;
    }
    notifyListeners();
  }

void changeBarItems(int index){
     currentIndex=index;
     category=categories[index];
     notifyListeners();
}
void changeCategory(int index){
     currentcatigor=index;
     category=categories[currentcatigor];
     notifyListeners();
}

}