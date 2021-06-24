part of 'services.dart';

class EmployeeServices {
  static Future<ApiReturnValue> getListEmployee(int page) async {
    try {
      var response =
          await Dio().get(baseUrl + 'users', queryParameters: {'page': page});

      var data = jsonDecode(jsonEncode(response.data));
      List<Employee> value =
          (data['data'] as Iterable).map((e) => Employee.fromJson(e)).toList();
      return ApiReturnValue(
          message: 'Success', statusCode: response.statusCode, value: value);
    } on DioError catch (e) {
      return ApiReturnValue(
          message: e.error, statusCode: e.response.statusCode);
    }
  }

  static Future<ApiReturnValue> createEmployee(String name, String job) async {
    try {
      var response = await Dio().post(baseUrl + 'users',
          data: jsonEncode({"name": name, "job": job}));

      var data = jsonDecode(jsonEncode(response.data));
      return ApiReturnValue(
          message: 'Create Employee Successfully',
          statusCode: response.statusCode,
          value: data['name']);
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
