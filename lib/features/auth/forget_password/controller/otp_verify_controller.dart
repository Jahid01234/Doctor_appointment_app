import 'dart:async';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class OtpVerifyController extends GetxController {
  final TextEditingController otpController = TextEditingController();

  RxBool isLoading = false.obs;
  RxInt remainingSeconds = 120.obs;
  RxString otpError = ''.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

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

  Future<void> verifyOtp() async {
    validateOtp(otpController.text);

    if (otpError.value.isEmpty) {
      isLoading.value = true;

      await Future.delayed(const Duration(seconds: 2));

      isLoading.value = false;

      EasyLoading.showSuccess("OTP Verified Successfully");
      clearForm();
      Get.toNamed(AppRoutes.setNewPassword);
    } else {
      EasyLoading.showError(otpError.value);
    }
  }

  // ⏱ Timer
  void startTimer() {
    _timer?.cancel();
    remainingSeconds.value = 120;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds.value > 0) {
        remainingSeconds.value--;
      } else {
        timer.cancel();
      }
    });
  }

  String get formattedTime {
    int seconds = remainingSeconds.value;
    return '${(seconds ~/ 60).toString().padLeft(2, '0')}:${(seconds % 60).toString().padLeft(2, '0')}';
  }

  void clearForm() {
    otpController.clear();
  }

  @override
  void onClose() {
    otpController.dispose();
    _timer?.cancel();
    super.onClose();
  }
}
