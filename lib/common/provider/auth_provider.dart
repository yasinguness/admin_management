// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_management/locator.dart';
import 'package:flutter/material.dart';

import 'package:admin_management/network/services/user/user_service.dart';

class AuthProvider extends ChangeNotifier {
  UserService userService = locator<UserService>();

  bool? _authenticated = false;

  bool get authenticated => _authenticated!;

  set authenticated(bool value) {
    _authenticated = value;
    notifyListeners();
  }

  Future login(String email, String password) async {
    authenticated = await userService.login(email, password);
  }
}
