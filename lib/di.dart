import 'package:apple_shop/data/repository/Authentication_repository.dart';
import 'package:apple_shop/data/source/Athentication.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

var locator = GetIt.instance;
Future<void> getItInit() async {
  locator.registerSingleton<Dio>(
    Dio(
      BaseOptions(baseUrl: 'https://startflutter.ir/api/'),
    ),
  );

  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());
  //

  locator
      .registerFactory<IAthenticationDatasource>(() => AuthenticationRemote());

  //repositories
  locator.registerFactory<IAuthRepository>(() => AuthenticationRepository());
}
