class UserLoginParams {
  final String email;
  final String password;

  UserLoginParams({
    required this.email,
    required this.password,
  });

  get body => {
        'email': email,
        'password': password,
      };
}
