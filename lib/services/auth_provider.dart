import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoggedIn = false;

  void updateLoginStatus(bool status) {
    isLoggedIn = status;
    notifyListeners();
  }
}