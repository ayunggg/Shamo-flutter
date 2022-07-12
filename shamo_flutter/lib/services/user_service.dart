import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shamo_flutter/models/user_model.dart';

class UserService {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  Future<void> setUser(UserModel user) async {
    try {
      _collectionReference.doc(user.id.toString()).set({
        'email': user.email,
        'name': user.name,
        'username': user.username,
        'token': user.token,
      });
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> getUser(int id) async {
    await Firebase.initializeApp();
    try {
      DocumentSnapshot documentSnapshot =
          await _collectionReference.doc(id.toString()).get();

      return UserModel(
          id: documentSnapshot.id.hashCode,
          name: documentSnapshot['name'],
          email: documentSnapshot['email'],
          username: documentSnapshot['username']);
    } catch (e) {
      rethrow;
    }
  }
}
