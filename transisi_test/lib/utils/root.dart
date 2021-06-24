import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:transisi_test/controllers/controllers.dart';
import 'package:transisi_test/ui/page/pages.dart';

class Root extends GetWidget<AuthController> {
  final AuthController authController = Get.put(AuthController());
  final GetStorage pref = GetStorage();
  @override
  Widget build(BuildContext context) {
    return (pref.read('isLogin') != null) ? MainPage() : LoginPage();
  }
}
