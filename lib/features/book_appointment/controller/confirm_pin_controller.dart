import 'dart:async';
import 'package:doctor_appointment_app/core/global_widgets/app_success_dialog.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ConfirmPinController extends GetxController {
  final TextEditingController otpController = TextEditingController();

  RxBool isLoading = false.obs;
  RxString otpError = ''.obs;


  // ✅ Correct OTP validation
  void validateOtp(String value) {
    if (value.isEmpty) {
      otpError.value = "OTP is required";
    } else if (value.length != 4) {
      otpError.value = "OTP must be 4 digits";
    } else if (!GetUtils.isNumericOnly(value)) {
      otpError.value = "OTP must contain only numbers";
    } else {
      otpError.value = '';
    }
  }

  Future<void> confirmOtp() async {
    validateOtp(otpController.text);

    if (otpError.value.isEmpty) {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));

      isLoading.value = false;

      Get.dialog(
        AppSuccessDialog(
          title: "Congratulations!",
          message:
          "Appointment successfully booked.\nYou will receive a notification and the doctor will contact you.",
          primaryButtonText: "View Appointment",
          onPrimaryTap: () {
            Get.back();
            //Get.toNamed(AppRoutes.myAppointmentScreen);
          },
          secondaryButtonText: "Cancel",
        ),
      );

    } else {
      EasyLoading.showError(otpError.value);
    }
  }


  @override
  void onClose() {
    otpController.dispose();
    super.onClose();
  }
}
