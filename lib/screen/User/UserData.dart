import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  Map<String, dynamic>? _userObject;

  Map<String, dynamic>? get userObject => _userObject;

  set userObject(Map<String, dynamic>? value) {
    _userObject = value;
    notifyListeners();
  }
}
