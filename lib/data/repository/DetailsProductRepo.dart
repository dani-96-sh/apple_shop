import 'package:apple_shop/data/source/DetailsProductDataSource.dart';
import 'package:apple_shop/di.dart';
import 'package:apple_shop/model/ImageProductModel.dart';
import 'package:apple_shop/model/VariantType.dart';
import 'package:apple_shop/model/productvariant.dart';

import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dartz/dartz.dart';

abstract class IDetailsProductRepository {
  Future<Either<String, List<ImageProductModel>>> GetGallery();

  Future<Either<String, List<VariantType>>> GetProductDetails();

  Future<Either<String, List<Productvariant>>> GetProductVarient();
}

class DetailsProductRepository extends IDetailsProductRepository {
  final IDetailProductDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ImageProductModel>>> GetGallery() async {
    try {
      var response = await _dataSource.GetGallery();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا');
    }
  }

  @override
  Future<Either<String, List<VariantType>>> GetProductDetails() async {
    try {
      var response = await _dataSource.GetVariantType();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا');
    }
  }

  @override
  Future<Either<String, List<Productvariant>>> GetProductVarient() async {
    try {
      var response = await _dataSource.GetProductVarient();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا');
    }
  }
}
