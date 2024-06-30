import 'package:apple_shop/data/source/categoryDatasource.dart';
import 'package:apple_shop/di.dart';
import 'package:apple_shop/model/CategoryModel.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dartz/dartz.dart';

abstract class IcategoryRepository {
  Future<Either<String, List<CategoryModel>>> getCategories();
}

class CategoryRepo extends IcategoryRepository {
  final IcategoryDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<CategoryModel>>> getCategories() async {
    try {
      var response = await _dataSource.getCategories();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? '');
    }
  }
}
