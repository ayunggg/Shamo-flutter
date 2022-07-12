import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String name;
  final String email;
  final String username;
  final String profilePhotoUrl;
  var token;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.username,
      this.profilePhotoUrl = '',
      this.token = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        profilePhotoUrl: json['profile_photo_url'],
        token: json['token'],
      );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profilePhotoUrl': profilePhotoUrl,
      'token': token,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        username,
        profilePhotoUrl,
        token,
      ];
}
