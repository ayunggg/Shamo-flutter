import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shamo_flutter/models/user_model.dart';
import 'package:shamo_flutter/services/auth_service.dart';

part 'auth_cubit_state.dart';

class AuthCubit extends Cubit<AuthCubitState> {
  AuthCubit() : super(AuthCubitInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());

      UserModel user =
          await AuthService().signIn(email: email, password: password);

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signUp(
      {required String email,
      required String name,
      required String password,
      required String username}) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthService().signUp(
        email: email,
        name: name,
        password: password,
        username: username,
      );

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
