part of 'auth_cubit_cubit.dart';

abstract class AuthCubitState extends Equatable {
  const AuthCubitState();

  @override
  List<Object> get props => [];
}

class AuthCubitInitial extends AuthCubitState {}

class AuthLoading extends AuthCubitState {}

class AuthSuccess extends AuthCubitState {
  final UserModel user;

  const AuthSuccess(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class AuthFailed extends AuthCubitState {
  final String error;

  const AuthFailed(this.error);
  @override
  // TODO: implement props
  List<Object> get props => [error];
}
