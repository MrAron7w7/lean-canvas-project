import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  String? _userId;
  Map<String, dynamic>? _userData;

  String? get userId => _userId;
  Map<String, dynamic>? get userData => _userData;

  void setUserId(String userId) {
    _userId = userId;
    notifyListeners();
  }

  void setUserData(Map<String, dynamic> userData) {
    _userData = userData;
    notifyListeners();
  }
}
