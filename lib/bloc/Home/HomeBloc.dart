import 'package:apple_shop/bloc/Home/HomeEvents.dart';
import 'package:apple_shop/bloc/Home/HomeState.dart';
import 'package:apple_shop/data/repository/BannerRepo.dart';
import 'package:apple_shop/data/repository/ProductRepository.dart';
import 'package:apple_shop/data/repository/categoryRepo.dart';

import 'package:apple_shop/di.dart';
import 'package:bloc/bloc.dart';

class Homebloc extends Bloc<HomeEvents, HomeState> {
  final IBannerRepo _iBannerRepo = locator.get();

  final IcategoryRepository _icategoryrepository = locator.get();

  final IProductRepository _iProductRepository = locator.get();
  Homebloc() : super(InitHomeState()) {
    on<HomeinitilzedData>((event, emit) async {
      emit(HomeLoadingState());
      var bannerlist = await _iBannerRepo.GetBanners();
      var categorylist = await _icategoryrepository.getCategories();
      var productlist = await _iProductRepository.GetProduct();
      var HotestProductList = await _iProductRepository.GetHotestProduct();
      var BestSellerProductList =
          await _iProductRepository.GetBestSellerProduct();
      emit(HomeSuccessState(bannerlist, categorylist, productlist,
          HotestProductList, BestSellerProductList));

      // emit(HomeRequestHotestState(HotestProductList));
    });
  }
}
