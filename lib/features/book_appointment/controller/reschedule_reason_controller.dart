import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RescheduleReasonController extends GetxController{
  final TextEditingController othersReasonController = TextEditingController();
  final RxBool isLoading = false.obs;
  final RxInt selectedIndex = (-1).obs;

  final List<String> reasons = [
    "I'm having a schedule clash",
    "I'm not available on schedule",
    "I have a activity that can't be left behind",
    "I don't want to tell",
    "Others",
  ];


  bool get isOthersSelected => selectedIndex.value == reasons.length - 1;

  void selectReason(int index) {
    selectedIndex.value = index;
    if (!isOthersSelected) {
      othersReasonController.clear();
    }
  }

  // Submit reschedule reason................
  Future<void> rescheduleReasonMethod() async {

    if (selectedIndex.value == -1) {
      _showErrorSnackbar("Please select a reason");
      return;
    }

    if (isOthersSelected && othersReasonController.text.trim().isEmpty) {
      _showErrorSnackbar("Please write your reason");
      return;
    }

    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      Get.toNamed(AppRoutes.rescheduleDateTimePicker);

      _showSuccessSnackbar(
        "Success",
        "Your reschedule request has been submitted.",
      );

    } catch (e) {
      _showErrorSnackbar("Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }

  void _showSuccessSnackbar(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.lightGreenColor,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: const Icon(Icons.error, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
    );
  }

  @override
  void onClose() {
    othersReasonController.dispose();
    super.onClose();
  }
}
