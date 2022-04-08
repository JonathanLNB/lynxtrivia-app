import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import '../modules/LogIn/LogInBinding.dart';
import '../modules/LogIn/LogInPage.dart';
import '../modules/Main/MainBinding.dart';
import '../modules/Main/MainPage.dart';
import '../modules/SplashScreen/SplashBinding.dart';
import '../modules/SplashScreen/SplashPage.dart';
import 'AppRoutes.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
        name: AppRoutes.SPLASH,
        page: () => SplashPage(),
        binding: SplashBinding(),
        transition: Transition.zoom),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LogInPage(),
        binding: LogInBinding(),
        transition: Transition.zoom),
    GetPage(
        name: AppRoutes.MAIN,
        page: () => MainPage(),
        binding: MainBinding(),
        transition: Transition.zoom),
  ];
}
