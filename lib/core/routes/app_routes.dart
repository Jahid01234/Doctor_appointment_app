import 'package:doctor_appointment_app/features/auth/login/view/login_screen.dart';
import 'package:doctor_appointment_app/features/auth/register/view/register_screen.dart';
import 'package:doctor_appointment_app/features/onboarding/view/onboarding_screen.dart';
import 'package:doctor_appointment_app/features/splash/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Get routes name here.......
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String bottomNavBar = '/bottomNavBar';
  static const String register = '/register';
  static const String login = '/login';





  // Get routes here.......
  static List<GetPage> routes = [
    GetPage(
      name: splash,
      page: () => SplashScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: onboarding,
      page: () => OnboardingScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: register,
      page: () => RegisterScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
      transition: Transition.leftToRight,
    ),

  ];
}