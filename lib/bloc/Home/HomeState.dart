import 'package:apple_shop/model/CategoryModel.dart';
import 'package:apple_shop/model/ProductModel.dart';
import 'package:apple_shop/model/bannerModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class InitHomeState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  Either<String, List<BannerModel>> bannerlist;

  Either<String, List<CategoryModel>> categoryList;

  Either<String, List<ProductModel>> productlist;
  HomeSuccessState(this.bannerlist, this.categoryList, this.productlist);
}
