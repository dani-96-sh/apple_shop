import 'package:apple_shop/di.dart';
import 'package:apple_shop/model/bannerModel.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dio/dio.dart';

abstract class IBannerDataSource {
  Future<List<BannerModel>> GetBanners();
}

class BannerRemoteDataSource extends IBannerDataSource {
  final Dio _dio = locator.get();
  @override
  Future<List<BannerModel>> GetBanners() async {
    var response = await _dio.get('collections/banner/records');
    try {
      return response.data['items']
          .map<BannerModel>((jsonObject) => BannerModel.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Error Message');
    }
  }
}
