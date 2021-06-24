part of 'services.dart';

class AuthServices {
  static Future<ApiReturnValue> login(String email, String password) async {
    try {
      var response = await Dio().post(baseUrl + 'login',
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          }),
          data: jsonEncode({"email": email, "password": password}));

      var data = jsonDecode(jsonEncode(response.data));
      return ApiReturnValue(
          message: 'Login Successfully',
          statusCode: response.statusCode,
          value: data['token']);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        return ApiReturnValue(
            message: 'Login Failed\n' + 'Kode : ' + e.error,
            statusCode: e.response.statusCode);
      } else {
        return ApiReturnValue(
            message: e.error, statusCode: e.response.statusCode);
      }
    }
  }

  static Future<ApiReturnValue> register(String email, String password) async {
    try {
      var response = await Dio().post(baseUrl + 'register',
          data: jsonEncode({"email": email, "password": password}));

      var data = jsonDecode(jsonEncode(response.data));
      return ApiReturnValue(
          message: 'Register  Successfully',
          statusCode: response.statusCode,
          value: data['token']);
    } on DioError catch (e) {
      if (e.response.statusCode == 404) {
        return ApiReturnValue(
            message: 'Register Failed\n' + 'Kode : ' + e.error,
            statusCode: e.response.statusCode);
      } else {
        return ApiReturnValue(
            message: e.error, statusCode: e.response.statusCode);
      }
    }
  }
}
