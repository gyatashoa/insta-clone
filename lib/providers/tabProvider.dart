import 'package:flutter/material.dart';

class TabProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex {
    return _currentIndex;
  }

  void set setCurrentIndex(int tab) {
    _currentIndex = tab;
    notifyListeners();
  }
}
