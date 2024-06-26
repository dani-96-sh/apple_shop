import 'package:apple_shop/data/source/AuthDatasource.dart';
import 'package:apple_shop/di.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:apple_shop/utility/auth_manager.dart';
import 'package:dartz/dartz.dart';
// import 'package:shared_preferences/shared_preferences.dart';

abstract class IAuthRepository {
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm);

  Future<Either<String, String>> login(String username, String password);
}

//مسئول این هست که دیتا بده یا ارور
class AuthenticationRepository extends IAuthRepository {
  // final SharedPreferences _sharedpref = locator.get();
  final IAuthenticationDatasource _datasource = locator.get();

  @override
  Future<Either<String, String>> register(
      String username, String password, String passwordConfirm) async {
    try {
      await _datasource.register('Hajdaniiii', '12345678', '12345678');
      return right('ثبت نام انجام شد');
    } catch (ex) {
      return left('خطا,محتوای متنی ندارد');
    }
  }

  @override
  Future<Either<String, String>> login(String username, String password) async {
    try {
      String token = await _datasource.login(username, password);
      if (token.isNotEmpty) {
        AuthManager.saveToken(token);

        return right('شما وارد شدید');
      } else {
        return left('خطایی پیش آمده');
      }
    } on ApiException catch (e) {
      return left('${e.message}');
    } catch (e) {
      return left('${e}');
    }
  }
}
