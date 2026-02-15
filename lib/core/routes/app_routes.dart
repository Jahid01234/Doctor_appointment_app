import 'package:doctor_appointment_app/features/auth/forget_password/view/forget_password_screen.dart';
import 'package:doctor_appointment_app/features/auth/forget_password/view/otp_verify_screen.dart';
import 'package:doctor_appointment_app/features/auth/forget_password/view/set_new_password_screen.dart';
import 'package:doctor_appointment_app/features/auth/login/view/login_screen.dart';
import 'package:doctor_appointment_app/features/auth/register/view/register_screen.dart';
import 'package:doctor_appointment_app/features/bottom_nav/view/bottom_nav_bar_screen.dart';
import 'package:doctor_appointment_app/features/onboarding/view/onboarding_screen.dart';
import 'package:doctor_appointment_app/features/profile/view/change_password_screen.dart';
import 'package:doctor_appointment_app/features/profile/view/edit_profile_screen.dart';
import 'package:doctor_appointment_app/features/splash/view/splash_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  // Get routes name here.......
  static const String splash = '/splash';
  static const String onboarding = '/onboarding';
  static const String bottomNavBar = '/bottomNavBar';
  static const String register = '/register';
  static const String login = '/login';
  static const String forgetPassword = '/forgetPassword';
  static const String otpVerify = '/otpVerify';
  static const String setNewPassword = '/setNewPassword';
  static const String editProfile = '/editProfile';
  static const String changePassword = '/changePassword';



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
    GetPage(
      name: forgetPassword,
      page: () => ForgetPasswordScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: otpVerify,
      page: () => OtpVerifyScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: setNewPassword,
      page: () => SetNewPasswordScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: bottomNavBar,
      page: () => BottomNavBarScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: editProfile,
      page: () => EditProfileScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: changePassword,
      page: () => ChangePasswordScreen(),
      transition: Transition.leftToRight,
    ),
  ];
}