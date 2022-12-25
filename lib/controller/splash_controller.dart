import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shopping/view/signin_page.dart';
import 'package:shopping/view/login.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    goToNextPage();
  }

  void goToNextPage() async {
    await Future.delayed(Duration(seconds: 2));
    Get.off(() => Login());
  }
}
