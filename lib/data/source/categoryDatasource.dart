import 'package:apple_shop/di.dart';
import 'package:apple_shop/model/CategoryModel.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dio/dio.dart';

abstract class IcategoryDataSource {
  Future<List<CategoryModel>> getCategories();
}

class Categorydatasource extends IcategoryDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      var response = await _dio.get('collections/category/records');

      return response.data['items']
          .map<CategoryModel>(
              (jsonObject) => CategoryModel.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Error Message');
    }
  }
}
