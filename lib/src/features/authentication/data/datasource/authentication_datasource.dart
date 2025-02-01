import 'package:flutter/widgets.dart';
import '../entities/user_login_params.dart';

abstract class AuthenticationDatasource {
  Future<bool> loginUser(UserLoginParams params);
}

class AuthenticationDatasourceImpl implements AuthenticationDatasource {
  @override
  Future<bool> loginUser(UserLoginParams params) async {
    try {
      if (params.email == "admin@gmail.com") {
        if (params.password == "admin") {
          return true;
        } else {
          return false;
        }
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
  }
}
