import '../datasource/authentication_datasource.dart';
import '../entities/user_login_params.dart';

abstract class AuthenticationRepository {
  Future<bool> loginUser(UserLoginParams params);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDatasource datasource;

  AuthenticationRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<bool> loginUser(UserLoginParams params) async {
    final result = await datasource.loginUser(params);
    return result;
  }
}
