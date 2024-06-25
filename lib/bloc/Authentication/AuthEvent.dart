class AuthEvents {}

class AuthLoginRequest extends AuthEvents {
  String username;
  String password;

  AuthLoginRequest(this.username, this.password);
}
