import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/data/data.dart';
import 'package:news_app/repositories/auth_repository.dart';
import 'package:news_app/utils/navigators/routes_management.dart';
import 'package:news_app/utils/utility.dart';

class AuthController extends GetxController {
  AuthController(this._repository);

  final AuthRepository _repository;

  var loginFormKey = GlobalKey<FormState>();
  var signFormKey = GlobalKey<FormState>();

  var db = Get.find<DBWrapper>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confrimpasswordController =
      TextEditingController();

  bool showPassward = true;

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Mail';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Invalid mail';
    }

    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter Password';
    }
    if (value.length < 8) {
      return 'atleast 8 characters';
    }
    if (!value.contains(RegExp('[a-z]'))) {
      return 'Lowercase alphabets (a-z)';
    }
    if (!value.contains(RegExp('[A-Z]'))) {
      return 'Uppercase alphabets (A-Z)';
    }
    if (!value.contains(RegExp('[0-9]'))) {
      return 'Number (0-9)';
    }
    // This Regex is to match special symbols
    if (!value.contains(RegExp('[^((0-9)|(a-z)|(A-Z)|)]'))) {
      return 'Special symbols (@,\$,! etc)';
    }
    return null;
  }

  void login() {
    try {
      if (!loginFormKey.currentState!.validate()) return;
      String mail = db.getStringValue('email');
      String password = db.getStringValue('password');

      if (mail == emailController.text.trim() &&
          password == passwordController.text.trim()) {
        db.saveValue('isLogin', true);
        RouteManagement.goToHome();
      } else {
        Utility.showDialog('Invalid user id or password');
      }
    } catch (e) {
      Utility.showDialog('User Not found');
    }
  }

  void signUp() {
    try {
      if (!signFormKey.currentState!.validate() &&
          passwordController.text != confrimpasswordController.text) return;
      db.saveValue('email', emailController.text.trim());
      db.saveValue('password', passwordController.text.trim());
      db.saveValue('isLogin', true);
      RouteManagement.goToHome();
    } catch (e) {
      Utility.showDialog('Not valid details');
    }
  }
}
