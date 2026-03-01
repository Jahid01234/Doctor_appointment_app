import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientDetailsController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController problemDesController = TextEditingController();

  RxBool isLoading = false.obs;






  void setPatientsDetailsMethod() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.toNamed(AppRoutes.payment);

    Get.snackbar(
      "Patient Details Saved",
      "Your information has been added successfully.",
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