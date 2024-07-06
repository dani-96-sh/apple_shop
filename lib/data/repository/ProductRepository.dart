import 'package:apple_shop/data/source/ProductDatasource.dart';
import 'package:apple_shop/di.dart';
import 'package:apple_shop/model/ProductModel.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dartz/dartz.dart';

abstract class IProductRepository {
  Future<Either<String, List<ProductModel>>> GetProduct();

   Future<Either<String, List<ProductModel>>> GetHotestProduct();


    Future<Either<String, List<ProductModel>>> GetBestSellerProduct();
}

class ProductRepository extends IProductRepository {
  final IProductDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<ProductModel>>> GetProduct() async {
    try {
      var response = await _dataSource.GetProduct();

      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا');
    }
  }
  
  @override
  Future<Either<String, List<ProductModel>>> GetBestSellerProduct()async {
    try {
      var response = await _dataSource.GetBestSellerProduct();

      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا');
    }
  }
  
  @override
  Future<Either<String, List<ProductModel>>> GetHotestProduct()async {
   try {
      var response = await _dataSource.GetHotestProduct();

      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا');
    }
  }
}
