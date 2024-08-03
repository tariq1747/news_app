import 'package:get/get.dart';

import '../../repositories/repositories.dart';

import '../view_model.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
      () => AuthController(
        AuthRepository(),
      ),
    );
  }
}
