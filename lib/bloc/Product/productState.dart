import 'package:apple_shop/model/ImageProductModel.dart';
import 'package:dartz/dartz.dart';

abstract class Productstate {}

class InitProductState extends Productstate {}

class LoadingProductState extends Productstate {}

class SuccessProductState extends Productstate {
  Either<String, List<ImageProductModel>> productImage;

  SuccessProductState(this.productImage);
}
