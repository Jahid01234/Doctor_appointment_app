import 'package:doctor_appointment_app/features/onboarding/view/onboarding_screen.dart';
import 'package:doctor_appointment_app/features/splash/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Get routes name here.......
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String bottomNavBar = '/bottomNavBar';





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

  ];
}