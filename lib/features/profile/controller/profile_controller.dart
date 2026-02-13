import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  RxBool isDarkMode = false.obs;

  void toggleSwitch(bool value) {
    isDarkMode.value = value;
  }

  void logoutTap(){
    Get.snackbar(
      "Logout Successful",
      "You have been logged out successfully",
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