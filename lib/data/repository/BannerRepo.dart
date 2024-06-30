import 'package:apple_shop/data/source/BannerDatasource.dart';
import 'package:apple_shop/di.dart';
import 'package:apple_shop/model/bannerModel.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dartz/dartz.dart';

abstract class IBannerRepo {
  Future<Either<String, List<BannerModel>>> GetBanners();
}

class BannerRepository extends IBannerRepo {
  final IBannerDataSource _dataSource = locator.get();
  @override
  Future<Either<String, List<BannerModel>>> GetBanners() async {
    try {
      var response = await _dataSource.GetBanners();
      return right(response);
    } on ApiException catch (e) {
      return left(e.message ?? 'خطا محتوای متنی ندارد');
    }
  }
}
