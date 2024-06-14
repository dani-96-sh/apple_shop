import 'package:apple_shop/di.dart';
import 'package:dio/dio.dart';

class AuthenticationRemote {
  final Dio _dio = locator.get();

  Future<void> register(
      String username, String password, String passwordConfirm) async {
    // try {
    final response = await _dio.post('collections/users/records', data: {
      'username': username,
      'password': password,
      'passwordConfirm': passwordConfirm
    });
    print('${response.statusCode}');
    // } on DioException catch (ex) {
    //   print(ex.response?.statusCode);
    // }
  }
}
