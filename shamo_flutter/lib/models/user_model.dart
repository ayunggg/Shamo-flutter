import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String username;

  const UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.username = '',
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        email,
        username,
      ];
}
