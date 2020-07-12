import 'package:flutter/material.dart';

class SwitchToHomeProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get getIsLoading => _isLoading;
  void set setIsLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }
}
