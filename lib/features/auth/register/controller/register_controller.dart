import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  RxBool isChecked = false.obs;
  RxBool isLoading = false.obs;

  RxString? userNameError = ''.obs;
  RxString? emailError = ''.obs;
  RxString? passwordError = ''.obs;
  RxString? termConditionError = ''.obs;

  void toggleCheck() {
    isChecked.value = !isChecked.value;
    validTermCondition();
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }


  void validateUserName(String value) {
    if (value.isEmpty) {
      userNameError!.value = "Username required";
    } else if (value.length < 3) {
      userNameError!.value = "Username must be at least 3 characters";
    } else {
      userNameError!.value = '';
    }
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

  void validTermCondition() {
    if (!isChecked.value) {
      termConditionError!.value =
      "Please accept the Privacy Policy and Terms of Use";
    } else {
      termConditionError!.value = '';
    }
  }

  Future<void> createAccount() async {
    // Validate all fields
    validateUserName(userNameController.text);
    validateEmail(emailController.text);
    validatePassword(passwordController.text);
    validTermCondition();

    // If all validations pass
    if (userNameError!.value.isEmpty &&
        emailError!.value.isEmpty &&
        passwordError!.value.isEmpty &&
       termConditionError!.value.isEmpty
    ) {
      // Start loading
      isLoading.value = true;

      // Simulate API call (replace with your actual API call)
      await Future.delayed(Duration(seconds: 3));

      // Stop loading
      isLoading.value = false;
      clearForm();
      EasyLoading.showSuccess("Registration is successful.");
      Get.toNamed(AppRoutes.login);

    } else {
      EasyLoading.showError("Please fix the errors");
    }
  }

  void clearForm(){
    userNameController.clear();
    emailController.clear();
    passwordController.clear();
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}