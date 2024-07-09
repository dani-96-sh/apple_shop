import 'package:apple_shop/di.dart';
import 'package:apple_shop/model/ImageProductModel.dart';
import 'package:apple_shop/model/productvariant.dart';
import 'package:apple_shop/model/variant.dart';
import 'package:apple_shop/model/VariantType.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dio/dio.dart';

abstract class IDetailProductDataSource {
  Future<List<ImageProductModel>> GetGallery();

  Future<List<VariantType>> GetVariantType();

  Future<List<Variant>> GetVariants();

  Future<List<Productvariant>> GetProductVarient();
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

  @override
  Future<List<VariantType>> GetVariantType() async {
    try {
      var response = await _dio.get(
        'collections/variants_type/records',
      );

      return response.data['items']
          .map<VariantType>((jsonObject) => VariantType.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Error Message');
    }
  }

  @override
  Future<List<Variant>> GetVariants() async {
    try {
      Map<String, String> qparams = {'filter': 'product_id="78n4wqor3hhnkju"'};
      var response = await _dio.get('collections/variants/records',
          queryParameters: qparams);

      return response.data['items']
          .map<Variant>((jsonObject) => Variant.fromMapJson(jsonObject))
          .toList();
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      throw ApiException(0, 'Error Message');
    }
  }

  @override
  Future<List<Productvariant>> GetProductVarient() async {
    var variantTypeList = await GetVariantType();

    var variantList = await GetVariants();

    List<Productvariant> productVariantList = [];

    for (var variantType in variantTypeList) {
      var variant = variantList
          .where((element) => element.typeId == variantType.id)
          .toList();
      productVariantList.add(Productvariant(variantType, variantList));
    }
    return productVariantList;
  }
}
