import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityController extends GetxController {
  RxBool rememberMe = true.obs;
  RxBool faceId = false.obs;
  RxBool biometricId = true.obs;

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
    _showSuccess("Remember Me ${value ? "enabled" : "disabled"}");
  }

  void toggleFaceId(bool value) {
    faceId.value = value;
    _showSuccess("Face ID ${value ? "enabled" : "disabled"}");
  }

  void toggleBiometricId(bool value) {
    biometricId.value = value;
    _showSuccess("Biometric ID ${value ? "enabled" : "disabled"}");
  }

  void enableGoogleAuth() {
    _showSuccess("Google Authenticator enabled successfully");
  }

  void changePin() {
      _showSuccess("Change pin successfully");
    }

  void _showSuccess(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.lightGreenColor,
      colorText: Colors.white,
      icon: Icon(Icons.check_circle, color: Colors.white),
      margin: EdgeInsets.all(16),
      borderRadius: 12,
      duration: Duration(seconds: 2),
    );
  }
}
