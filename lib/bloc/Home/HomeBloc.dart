import 'package:apple_shop/bloc/Home/HomeEvents.dart';
import 'package:apple_shop/bloc/Home/HomeState.dart';
import 'package:apple_shop/data/repository/BannerRepo.dart';
import 'package:apple_shop/di.dart';
import 'package:bloc/bloc.dart';

class Homebloc extends Bloc<HomeEvents, HomeState> {
  final IBannerRepo _iBannerRepo = locator.get();
  Homebloc() : super(InitHomeState()) {
    on<HomeinitilzedData>((event, emit) async {
      emit(HomeLoadingState());
      var bannerlist = await _iBannerRepo.GetBanners();
      emit(HomeSuccessState(bannerlist));
    });
  }
}
