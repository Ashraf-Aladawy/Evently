
import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{

  ThemeMode themeMode = ThemeMode.light;
  int currentIndex = 0;
  int currentcatigor = 0;
  List<String> categories = [
    "All",
    "Birthday",
    "Sport",
    "Sport",
    "Sport",
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
     notifyListeners();
}
void changeCategory(int index){
     currentcatigor=index;
     notifyListeners();
}
}