import 'package:apple_shop/model/CategoryModel.dart';
import 'package:dartz/dartz.dart';

abstract class CateState {}

class CateInit extends CateState {}

class CateResponse extends CateState {
  Either<String, List<CategoryModel>> response;

  CateResponse(this.response);
}

class CateLoading extends CateState {}
