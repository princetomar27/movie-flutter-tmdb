import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/errors/failures.dart';
import '../../data/entities/user_login_params.dart';
import '../../data/repository/authentication_repository.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final AuthenticationRepository repository;

  AuthenticationCubit({required this.repository})
      : super(AuthenticationInitial(
          userName: null,
          password: null,
        ));

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  Future<void> login({required VoidCallback onLoginSuccess}) async {
    emit(AuthenticationLoading(
      userName: state.userName,
      password: state.password,
    ));

    UserLoginParams params = UserLoginParams(
      email: state.userName ?? '',
      password: state.password ?? '',
    );

    final result = await repository.loginUser(params);

    if (result == false) {
      emit(
        AuthenticationFailure(
          userName: state.userName,
          password: state.password,
        ),
      );
    } else {
      emit(
        AuthenticationSuccess(
          isLoggedIn: true,
          userName: state.userName,
          password: state.password,
        ),
      );
      onLoginSuccess();
    }
  }

  void updateUserName(String userName) {
    emit(state.copyWith(userName: userName));
  }

  void updatePassword(String password) {
    emit(state.copyWith(password: password));
  }

  void reset() {
    emit(AuthenticationInitial(
      userName: null,
      password: null,
    ));
  }
}
