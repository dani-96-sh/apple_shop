import 'package:apple_shop/model/ImageProductModel.dart';
import 'package:apple_shop/model/VariantType.dart';
import 'package:apple_shop/model/productvariant.dart';
import 'package:dartz/dartz.dart';

abstract class Productstate {}

class InitProductState extends Productstate {}

class LoadingProductState extends Productstate {}

class SuccessProductState extends Productstate {
  Either<String, List<ImageProductModel>> productImage;
  Either<String, List<Productvariant>> variantList;
  SuccessProductState(this.productImage, this.variantList);
}
