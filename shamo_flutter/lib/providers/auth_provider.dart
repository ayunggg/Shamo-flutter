import 'package:flutter/cupertino.dart';
import 'package:shamo_flutter/models/user_model.dart';
import 'package:shamo_flutter/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _userModel;

  AuthProvider(this._userModel);
  UserModel get user => _userModel;

  set user(UserModel user) {
    _userModel = user;
    notifyListeners();
  }

  Future<bool> register(
      String name, String email, String password, String username) async {
    try {
      UserModel user = await AuthService().signUp(
        email: email,
        name: name,
        password: password,
        username: username,
      );

      _userModel = user;
      return true;
    } catch (e) {
      throw Exception('Gagal');
    }
  }
}
