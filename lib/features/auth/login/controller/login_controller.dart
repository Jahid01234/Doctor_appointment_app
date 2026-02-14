import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  RxBool isLoading = false.obs;

  RxString? emailError = ''.obs;
  RxString? passwordError = ''.obs;

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }


  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError!.value = "Email required";
    } else if (!GetUtils.isEmail(value)) {
      emailError!.value = "Invalid email";
    } else {
      emailError!.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError!.value = "Password required";
    } else if (value.length < 8) {
      passwordError!.value = "Minimum 8 characters";
    } else {
      passwordError!.value = '';
    }
  }

  Future<void> loginAccount() async {
    // Validate all fields
    validateEmail(emailController.text);
    validatePassword(passwordController.text);


    // If all validations pass
    if (emailError!.value.isEmpty && passwordError!.value.isEmpty) {
      // Start loading
      isLoading.value = true;

      // Simulate API call (replace with your actual API call)
      await Future.delayed(Duration(seconds: 3));

      // Stop loading
      isLoading.value = false;
      clearForm();
      EasyLoading.showSuccess("Login is successful.");
      Get.offNamed(AppRoutes.bottomNavBar);

    } else {
      EasyLoading.showError("Please fix the errors");
    }
  }

  void clearForm(){
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}