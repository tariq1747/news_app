import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/res/res.dart';
import 'package:news_app/utils/navigators/routes_management.dart';
import 'package:news_app/view_model/auth/auth_controller.dart';
import 'package:news_app/widgets/custom_button.dart';
import 'package:news_app/widgets/custom_text_field.dart';
import 'package:news_app/widgets/widgets.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) => GetBuilder<AuthController>(
        builder: (controller) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Form(
              key: controller.loginFormKey,
              child: Padding(
                padding: Dimens.edgeInsets16_100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                      ),
                    ),
                    Dimens.boxHeight8,
                    CustomTextField.email(
                      hintText: 'Enter Email',
                      controller: controller.emailController,
                      validator: controller.emailValidator,
                    ),
                    Dimens.boxHeight16,
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Password')),
                    Dimens.boxHeight8,
                    CustomTextField.password(
                      hintText: 'Enter Password',
                      maxLines: 1,
                      suffixIcon: IconButton(
                        icon: Icon(!controller.showPassward
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          controller.showPassward = !controller.showPassward;
                          controller.update();
                        },
                      ),
                      obscureText: !controller.showPassward,
                      obscureCharacter: '*',
                      controller: controller.passwordController,
                      validator: controller.passwordValidator,
                    ),
                    Dimens.boxHeight32,
                    CustomButton(
                      onPressed: () {
                        controller.login();
                      },
                      label: 'Login',
                    ),
                    Dimens.boxHeight20,
                    CustomButton(
                      onPressed: () {
                        RouteManagement.goToSignUP();
                      },
                      label: 'SignUp',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
