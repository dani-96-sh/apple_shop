import 'package:apple_shop/model/bannerModel.dart';
import 'package:dartz/dartz.dart';

abstract class HomeState {}

class InitHomeState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  Either<String, List<BannerModel>> bannerlist;
  HomeSuccessState(this.bannerlist);
}
