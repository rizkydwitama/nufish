import 'package:flutter/material.dart';
import 'package:nufish/services/auth_service.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> registerProvider({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    try {
      UserModel user = await AuthService().registerService(
          name: name,
          username: username,
          email: email,
          password: password
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loginProvider({
    required String email,
    required String password
  }) async {
    try {
      UserModel user = await AuthService().loginService(
          email: email,
          password: password
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }
}