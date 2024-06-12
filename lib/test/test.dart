import 'package:dartz/dartz.dart';

Either<String, String> sendData(int x) {
  if (x == 1) {
    return Right('check');
  } else {
    return Left('error');
  }
}
