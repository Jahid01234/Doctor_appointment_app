import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController{
  final TextEditingController emailEditingController = TextEditingController();
  RxBool isLoading = false.obs;

  RxString? emailError = RxString('');



  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError!.value = "Email required";
    } else if (!GetUtils.isEmail(value)) {
      emailError!.value = "Invalid email";
    } else {
      emailError!.value = '';
    }
  }



  Future<void> sendEmail() async {
    // Validate all fields
    validateEmail(emailEditingController.text);


    // If all validations pass
    if (emailError!.value.isEmpty) {
      // Start loading
      isLoading.value = true;

      // Simulate API call (replace with your actual API call)
      await Future.delayed(Duration(seconds: 3));

      // Stop loading
      isLoading.value = false;
      clearForm();
      EasyLoading.showSuccess("Send to email is successful.");
      Get.toNamed(AppRoutes.otpVerify);

    } else {
      EasyLoading.showError("Please fix the errors");
    }
  }

  void clearForm(){
    emailEditingController.clear();
  }

  @override
  void dispose() {
    emailEditingController.dispose();
    super.dispose();
  }

}