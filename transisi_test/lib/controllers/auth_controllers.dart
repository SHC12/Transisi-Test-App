part of 'controllers.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;
  Rxn<Employee> users = Rxn<Employee>();
  var pref = GetStorage();

  void setPref(String token) {
    pref.write('token', token);
    pref.write('isLogin', true);
  }

  void login(String email, String password) async {
    isLoading(true);

    ApiReturnValue apiResult = await AuthServices.login(email, password);
    if (apiResult.value != null) {
      setPref(apiResult.value);
      isLoading(false);
      Get.snackbar('Message', 'Login Success',
          margin: EdgeInsets.all(12),
          backgroundColor: Colors.white60,
          snackPosition: SnackPosition.BOTTOM);
      Get.offAll(MainPage());
    } else {
      isLoading(false);

      Get.snackbar('Error', apiResult.message,
          margin: EdgeInsets.all(12),
          backgroundColor: Colors.white60,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void register(String email, String password) async {
    isLoading(true);
    ApiReturnValue apiResult = await AuthServices.register(email, password);
    if (apiResult.value != null) {
      setPref(apiResult.value);
      isLoading(false);
      Get.snackbar('Message', 'Register Success',
          margin: EdgeInsets.all(12),
          backgroundColor: Colors.white60,
          snackPosition: SnackPosition.BOTTOM);
      Get.offAll(MainPage());
    } else {
      isLoading(false);

      Get.snackbar('Error', apiResult.message,
          margin: EdgeInsets.all(12),
          backgroundColor: Colors.white60,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
