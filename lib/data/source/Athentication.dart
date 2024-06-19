import 'package:apple_shop/di.dart';
import 'package:dio/dio.dart';

abstract class IAthenticationDatasource {
  Future<void> register(
      String username, String password, String passwordConfirm);

  Future<String> login(
    String username,
    String password,
  );
}

class AuthenticationRemote implements IAthenticationDatasource {
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
      print(ex.response?.data['message']);
      print(ex.message);
    }
  }

  @override
  Future<String> login(String username, String password) async {
    try {
      var response = await _dio.post('collections/users/auth-with-password',
          data: {'identity': username, 'password': password});
      if (response.statusCode == 200) {
        return response.data?['token'];
      }
    } on DioError catch (e) {}
    return '';
  }
}
