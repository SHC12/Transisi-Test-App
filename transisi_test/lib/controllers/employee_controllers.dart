part of 'controllers.dart';

class EmployeeController extends GetxController {
  var isLoading = false.obs;
  var listEmployee = <Employee>[].obs;
  var pref = GetStorage();
  var isMoreDataAvailable = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchEmployee(1);
  }

  fetchEmployee(int page) async {
    isMoreDataAvailable(false);
    isLoading(true);

    ApiReturnValue result = await EmployeeServices.getListEmployee(page);
    List<Employee> list = result.value;
    if (list != null) {
      isLoading(false);
      listEmployee.addAll(list);
    } else {
      isLoading(false);
      isMoreDataAvailable(false);
    }
  }

  void getMoreEmployee(int page) async {
    isLoading(true);
    fetchEmployee(page);
  }

  void createEmployee(String name, String job) async {
    isLoading(true);
    ApiReturnValue apiResult = await EmployeeServices.createEmployee(name, job);
    if (apiResult.value != null) {
      isLoading(false);

      Get.offAll(MainPage());
      Get.snackbar('Message', apiResult.message,
          margin: EdgeInsets.all(12),
          backgroundColor: Colors.white60,
          snackPosition: SnackPosition.BOTTOM);
    } else {
      isLoading(false);

      Get.snackbar('Error', apiResult.message,
          margin: EdgeInsets.all(12),
          backgroundColor: Colors.white60,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
