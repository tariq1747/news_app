import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/res/theme/dimens.dart';
import 'package:news_app/utils/navigators/routes_management.dart';
import 'package:news_app/view_model/auth/auth_controller.dart';
import 'package:news_app/widgets/custom_button.dart';
import 'package:news_app/widgets/custom_text_field.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  static const String route = '/signup';

  @override
  Widget build(BuildContext context) => GetBuilder<AuthController>(
        builder: (controller) => Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Form(
              key: controller.signFormKey,
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
                      onchange: (value) {},
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
                      onchange: (value) {},
                      maxLines: 1,
                      suffixIcon: IconButton(
                        icon: Icon(!controller.showPassward
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          controller.showPassward = !controller.showPassward;
                        },
                      ),
                      obscureText: !controller.showPassward,
                      obscureCharacter: '*',
                      controller: controller.passwordController,
                      validator: controller.passwordValidator,
                    ),
                    Dimens.boxHeight32,
                    const Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Confirm Password')),
                    Dimens.boxHeight8,
                    CustomTextField.password(
                      hintText: 'Enter Confirm Password',
                      onchange: (value) {},
                      maxLines: 1,
                      suffixIcon: IconButton(
                        icon: Icon(!controller.showPassward
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined),
                        onPressed: () {
                          controller.showPassward = !controller.showPassward;
                        },
                      ),
                      obscureText: !controller.showPassward,
                      obscureCharacter: '*',
                      controller: controller.confrimpasswordController,
                      validator: controller.passwordValidator,
                    ),
                    Dimens.boxHeight32,
                    CustomButton(
                      onPressed: () {
                        controller.signUp();
                      },
                      label: 'SignUp',
                    ),
                    Dimens.boxHeight20,
                    CustomButton(
                      onPressed: () {
                        RouteManagement.goToSignIn();
                      },
                      label: 'Login',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
