import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isPasswordHidden = true.obs;
  RxBool isChecked = false.obs;
  RxString? userNameError = RxString('');
  RxString? emailError = RxString('');
  RxString? passwordError = RxString('');

  void toggleCheck() {
    isChecked.value = !isChecked.value;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }


  void validateUserName(String value) {
    if (value.isEmpty) {
      userNameError!.value = "Username required";
    } else {
      userNameError!.value = '';
    }
  }

  void validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      emailError!.value = "Invalid email";
    } else {
      emailError!.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.length < 8) {
      passwordError!.value = "Minimum 8 characters";
    } else {
      passwordError!.value = '';
    }
  }



  Future<void> createAccount() async {
    validateUserName(userNameController.text);
    validateEmail(emailController.text);
    validatePassword(passwordController.text);

    if (userNameError!.value.isEmpty &&
        emailError!.value.isEmpty &&
        passwordError!.value.isEmpty) {
      // ✅ all good
    }
  }


  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}