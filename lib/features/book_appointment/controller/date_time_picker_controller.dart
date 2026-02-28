import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimePickerController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString selectedTime = '09.00 AM'.obs;
  RxBool isLoading = false.obs;

  final List<String> timeSlots = [
    '09.00 AM',
    '09.30 AM',
    '10.00 AM',
    '10.30 PM',
    '11.00 PM',
    '11.30 PM',
    '15.00 PM',
    '15.30 PM',
    '16.00 PM',
    '16.30 PM',
    '17.00 PM',
    '17.30 PM',
  ];

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void selectTime(String time) {
    selectedTime.value = time;
  }




  void setDateTimeMethod() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.toNamed(AppRoutes.selectPackage);

    Get.snackbar(
      "Schedule Updated",
      "Your appointment date and time are confirmed.",
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