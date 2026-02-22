import 'package:doctor_appointment_app/features/auth/forget_password/view/forget_password_screen.dart';
import 'package:doctor_appointment_app/features/auth/forget_password/view/otp_verify_screen.dart';
import 'package:doctor_appointment_app/features/auth/forget_password/view/set_new_password_screen.dart';
import 'package:doctor_appointment_app/features/auth/login/view/login_screen.dart';
import 'package:doctor_appointment_app/features/auth/register/view/register_screen.dart';
import 'package:doctor_appointment_app/features/bottom_nav/view/bottom_nav_bar_screen.dart';
import 'package:doctor_appointment_app/features/help_center/view/help_center_screen.dart';
import 'package:doctor_appointment_app/features/home/view/home_screen.dart';
import 'package:doctor_appointment_app/features/language/view/language_screen.dart';
import 'package:doctor_appointment_app/features/message/view/audio_call_screen.dart';
import 'package:doctor_appointment_app/features/message/view/video_call_screen.dart';
import 'package:doctor_appointment_app/features/privacy_policy/privacy_policy_screen.dart';
import 'package:doctor_appointment_app/features/profile/view/profile_screen.dart';
import 'package:doctor_appointment_app/features/terms_conditions/terms_and_conditions_screen.dart';
import 'package:doctor_appointment_app/features/notification/view/notification_screen.dart';
import 'package:doctor_appointment_app/features/onboarding/view/onboarding_screen.dart';
import 'package:doctor_appointment_app/features/payment/view/payment_screen.dart';
import 'package:doctor_appointment_app/features/profile/view/change_password_screen.dart';
import 'package:doctor_appointment_app/features/profile/view/edit_profile_screen.dart';
import 'package:doctor_appointment_app/features/security/view/security_screen.dart';
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
  static const String notification = '/notification';
  static const String security = '/security';
  static const String payment = '/payment';
  static const String helpCenter = '/helpCenter';
  static const String termsAndConditions = '/termsAndConditions';
  static const String privacyPolicy = '/privacyPolicy';
  static const String audioCall = '/audioCall';
  static const String videoCall = '/videoCall';
  static const String language = '/language';
  static const String home = '/home';
  static const String profile = '/profile';



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
    GetPage(
      name: notification,
      page: () => NotificationScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: security,
      page: () => SecurityScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: payment,
      page: () => PaymentScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: helpCenter,
      page: () => HelpCenterScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: termsAndConditions,
      page: () => TermsAndConditionsScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: privacyPolicy,
      page: () => PrivacyPolicyScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: audioCall,
      page: () => AudioCallScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: videoCall,
      page: () => VideoCallScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: language,
      page: () => LanguageScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
      transition: Transition.leftToRight,
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
      transition: Transition.leftToRight,
    ),
  ];
}