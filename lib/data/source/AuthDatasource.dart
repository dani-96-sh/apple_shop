import 'package:apple_shop/di.dart';
import 'package:apple_shop/utility/Api_Exception.dart';
import 'package:dio/dio.dart';

abstract class IAuthenticationDatasource {
  Future<void> register(
      String username, String password, String passwordConfirm);

  Future<String> login(
    String username,
    String password,
  );
}

class AuthenticationRemote implements IAuthenticationDatasource {
  final Dio _dio = locator.get();

  @override
  Future<void> register(
      String username, String password, String passwordConfirm) async {
    try {
      final response = await _dio.post(
        'collections/users/records',
        data: {
          'username': username,
          'password': password,
          'passwordConfirm': passwordConfirm
        },
      );
      print('${response.statusCode}');
    } on DioException catch (ex) {
      throw ApiException(ex.response?.statusCode, ex.response?.data['message']);
    } catch (ex) {
      print(ex);
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      var response =
          await _dio.post('collections/users/auth-with-password', data: {
        'identity': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        return response.data?['token'];
      }
    } on DioException catch (e) {
      print(e);
      // throw ApiException(e.response?.data, e.response?.data['message']);
    } catch (ex) {
      print(ex);
      // throw ApiException(0, 'error');
    }
    return 'ddd';
  }
}
