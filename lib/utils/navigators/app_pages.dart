import 'package:get/get.dart';

import '../../view_model/view_model.dart';
import '../../views/views.dart';

part 'app_routes.dart';

class AppPages {
  static var transitionDuration = const Duration(
    milliseconds: 350,
  );

  static const initial = Routes.splash;

  static final pages = [
    GetPage<SplashView>(
      name: Routes.splash,
      transitionDuration: transitionDuration,
      page: SplashView.new,
      binding: SplashBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<HomeView>(
      name: Routes.home,
      transitionDuration: transitionDuration,
      page: HomeView.new,
      binding: HomeBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<LoginView>(
      name: Routes.login,
      transitionDuration: transitionDuration,
      page: LoginView.new,
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
    GetPage<SignupView>(
      name: Routes.signup,
      transitionDuration: transitionDuration,
      page: SignupView.new,
      binding: AuthBinding(),
      transition: Transition.rightToLeft,
    ),
  ];
}
