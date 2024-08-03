import 'dart:developer';

import 'package:get/get.dart';
import 'package:news_app/data/data.dart';

import '../../utils/navigators/navigators.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    startOnInit();
  }

  var isLoggedIn = false;

  void startOnInit() async {
    isLoggedIn = Get.find<DBWrapper>().getBoolValue('isLogin');
    await Future.delayed(const Duration(seconds: 3));
    if (isLoggedIn) {
      RouteManagement.goToHome();
    } else {
      RouteManagement.goToSignIn();
    }
  }
}
