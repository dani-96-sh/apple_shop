import 'package:dartz/dartz.dart';

class Authstate {}

class AuthInitState extends Authstate {}

class AuthloadingState extends Authstate {}

class AuthResponseState extends Authstate {
  Either<String, String> response;

  AuthResponseState(this.response);
}
