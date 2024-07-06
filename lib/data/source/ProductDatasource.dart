import 'package:apple_shop/di.dart';
import 'package:apple_shop/model/ProductModel.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dio/dio.dart';

abstract class IProductDataSource {
  Future<List<ProductModel>> GetProduct();

  Future<List<ProductModel>> GetHotestProduct();

  Future<List<ProductModel>> GetBestSellerProduct();
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

  @override
  Future<List<ProductModel>> GetBestSellerProduct() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="Best Seller"'};
      var Response = await _dio.get('collections/products/records',
          queryParameters: qParams);
      return Response.data['items']
          .map<ProductModel>((jsonObject) => ProductModel.fromJson(jsonObject))
          .toList();
    } on ApiException catch (ex) {
      throw ApiException(ex.code, ex.message ?? '');
    } catch (ex) {
      throw ApiException(0, 'message');
    }
  }

  @override
  Future<List<ProductModel>> GetHotestProduct() async {
    try {
      Map<String, String> qParams = {'filter': 'popularity="Hotest"'};
      var Response = await _dio.get('collections/products/records',
          queryParameters: qParams);
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
