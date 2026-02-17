import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentController extends GetxController{
  RxInt selectedIndex = 0.obs;
  RxBool isLoading = false.obs;

  final List<String> paymentMethods = [
    IconsPath.stripe,
    IconsPath.paypal,
    IconsPath.visa,
    IconsPath.payoneer
  ];

  void selectCard(int index) {
    selectedIndex.value = index;
  }




  void paymentMethod() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;

    Get.snackbar(
      "Payment Successful",
      "Your payment has been completed successfully!",
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