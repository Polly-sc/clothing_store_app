import 'package:flutter/material.dart';

class AuthPageModel extends ChangeNotifier {

  void _updateState(String? errorMessage, bool isAuthProgress) {
    notifyListeners();
  }
}