part of 'authentication_cubit.dart';

abstract class AuthenticationState extends Equatable {
  final String? userName;
  final String? password;
  const AuthenticationState({
    required this.userName,
    required this.password,
  });

  @override
  List<Object?> get props => [
        userName,
        password,
      ];

  AuthenticationState copyWith({
    String? userName,
    String? password,
  });
}

class AuthenticationInitial extends AuthenticationState {
  AuthenticationInitial({required super.userName, required super.password});

  @override
  AuthenticationState copyWith({
    String? userName,
    String? password,
  }) {
    return AuthenticationInitial(
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }
}

class AuthenticationLoading extends AuthenticationState {
  AuthenticationLoading({required super.userName, required super.password});

  @override
  AuthenticationState copyWith({
    String? userName,
    String? password,
  }) {
    return AuthenticationLoading(
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }
}

class AuthenticationSuccess extends AuthenticationState {
  final bool isLoggedIn;

  const AuthenticationSuccess(
      {required super.userName,
      required super.password,
      required this.isLoggedIn});

  @override
  List<Object?> get props => [isLoggedIn, userName, password];

  @override
  AuthenticationState copyWith({
    String? userName,
    String? password,
    bool? isLoggedIn,
  }) {
    return AuthenticationSuccess(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
    );
  }
}

class AuthenticationFailure extends AuthenticationState {
  // TODO: To make it more efficient, we can create a failureType class and use it in app to
  // detect and handle different failure types
  const AuthenticationFailure(
      {required super.userName, required super.password});

  @override
  List<Object?> get props => [userName, password];

  @override
  AuthenticationState copyWith({
    String? userName,
    String? password,
    Failure? failure,
  }) {
    return AuthenticationFailure(
      userName: userName ?? this.userName,
      password: password ?? this.password,
    );
  }
}
