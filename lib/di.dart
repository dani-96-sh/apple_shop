import 'package:apple_shop/data/repository/AuthRepository.dart';
import 'package:apple_shop/data/repository/BannerRepo.dart';
import 'package:apple_shop/data/repository/categoryRepo.dart';
import 'package:apple_shop/data/source/AuthDatasource.dart';
import 'package:apple_shop/data/source/BannerDatasource.dart';
import 'package:apple_shop/data/source/categoryDatasource.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.I;
Future<void> getItInit() async {
  // locator.registerSingleton<abstractClass>();
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://startflutter.ir/api/'),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );

  //datasources
  locator.registerFactory<IAuthenticationDatasource>(
    () => AuthenticationRemote(),
  );
  locator.registerFactory<IcategoryDataSource>(
    () => Categorydatasource(),
  );

  locator.registerFactory<IBannerDataSource>(
    () => BannerRemoteDataSource(),
  );

  //repositories
  locator.registerFactory<IAuthRepository>(
    () => AuthenticationRepository(),
  );
  locator.registerFactory<IcategoryRepository>(
    () => CategoryRepo(),
  );

  locator.registerFactory<IBannerRepo>(
    () => BannerRepository(),
  );
}
