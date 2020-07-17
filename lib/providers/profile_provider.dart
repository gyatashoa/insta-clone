import 'package:flutter/material.dart';

class ProfileProvider with ChangeNotifier {
  bool _isUidReady = false;
  bool get getIsUidReady => _isUidReady;
  set setIsUidReady(bool val) {
    _isUidReady = val;
    notifyListeners();
  }
}
