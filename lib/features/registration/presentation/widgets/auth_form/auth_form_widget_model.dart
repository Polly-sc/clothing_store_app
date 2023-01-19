import 'package:flutter/material.dart';

class AuthFormWidgetModel extends ChangeNotifier {
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  void _updateState(String? errorMessage, bool isAuthProgress) {
    notifyListeners();
  }
}