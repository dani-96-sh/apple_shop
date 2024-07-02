import 'package:apple_shop/di.dart';
import 'package:apple_shop/model/ProductModel.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>> GetProduct();
}

class ProductsDataSource extends IProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ProductModel>> GetProduct() async {
    try {
      var Response = await _dio.get('collections/products/records');
      return Response.data['items']
          .map<ProductModel>((jsonObject) => ProductModel.fromJson(jsonObject))
          .toList();
    } on ApiException catch (ex) {
      throw ApiException(ex.code, ex.message ?? '');
    } catch (ex) {
      throw ApiException(0, 'message');
    }
  }
}
