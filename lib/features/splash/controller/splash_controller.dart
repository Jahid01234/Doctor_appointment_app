import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    redirectToNextScreen();
  }

  // Go to onboarding screen ...
  Future<void> redirectToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
      Get.offNamed(AppRoutes.onboarding);
  }
}
