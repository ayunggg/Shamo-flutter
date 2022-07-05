import 'package:firebase_auth/firebase_auth.dart';
import 'package:shamo_flutter/models/user_model.dart';
import 'package:shamo_flutter/services/user_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserModel> signIn(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      UserModel user = await UserService().getUser(userCredential.user!.uid);
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> signUp({
    required String email,
    required String name,
    required String password,
    required String username,
  }) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel user = UserModel(
        id: userCredential.user!.uid,
        name: name,
        email: email,
      );
      return user;
    } catch (e) {
      rethrow;
    }
  }
}
