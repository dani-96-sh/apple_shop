import 'package:apple_shop/di.dart';
import 'package:apple_shop/model/ImageProductModel.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dio/dio.dart';

abstract class IDetailProductDataSource {
  Future<List<ImageProductModel>> GetGallery();
}

class Detailsproductdatasource extends IDetailProductDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<ImageProductModel>> GetGallery() async {
    try {
      Map<String, String> qparams = {'filter': 'product_id="78n4wqor3hhnkju"'};

      var response = await _dio.get('collections/gallery/records',
          queryParameters: qparams);

      return response.data['items']
          .map<ImageProductModel>(
              (jsonObject) => ImageProductModel.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Error Message');
    }
  }
}
