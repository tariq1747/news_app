import 'package:get/get.dart';

import 'app_pages.dart';

abstract class RouteManagement {
  /// Go to the SignIn Screen
  static void goToSignIn() {
    Get.offAllNamed<void>(
      Routes.login,
    );
  }

  /// Go to the SignUp Screen
  static void goToSignUP() {
    Get.offAllNamed<void>(
      Routes.signup,
    );
  }

  /// Go to the Home Screen
  static void goToHome() {
    Get.offAllNamed<void>(
      Routes.home,
    );
  }
}
