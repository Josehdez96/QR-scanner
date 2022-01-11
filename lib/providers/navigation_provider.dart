import 'package:flutter/material.dart';

class NavigationProvider extends ChangeNotifier {
  int _selectedMenuOption = 0;

  int get selectedMenuOption => _selectedMenuOption;

  set selectedMenuOption( int i ) {
    _selectedMenuOption = i;
    notifyListeners();
  }
}