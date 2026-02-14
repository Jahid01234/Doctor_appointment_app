import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SetNewPasswordController extends GetxController{
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  RxBool isLoading = false.obs;
  var isNewPassword = true.obs;
  var isConfirmPassword = true.obs;

  void toggleNewPassword(){
    isNewPassword.value = !isNewPassword.value;
  }

  void toggleConfirmPassword(){
    isConfirmPassword.value = !isConfirmPassword.value;
  }


  RxString? passwordError = RxString('');
  RxString? confirmPasswordError = RxString('');



  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError!.value = "Password required";
    } else if (value.length < 8) {
      passwordError!.value = "Minimum 8 characters";
    } else {
      passwordError!.value = '';
    }
  }

  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordError!.value = "Confirm Password required";
    } else if (value.length < 8) {
      confirmPasswordError!.value = "Minimum 8 characters";
    } else if (value != newPasswordController.text) {
      confirmPasswordError!.value = "Passwords do not match";
    } else {
      confirmPasswordError!.value = '';
    }
  }




  Future<void> setNewPassword() async {
    // Validate all fields
    validatePassword(newPasswordController.text);
    validateConfirmPassword(confirmPasswordController.text);


    // If all validations pass
    if (passwordError!.value.isEmpty && confirmPasswordError!.value.isEmpty) {
      // Start loading
      isLoading.value = true;

      // Simulate API call (replace with your actual API call)
      await Future.delayed(Duration(seconds: 3));

      // Stop loading
      isLoading.value = false;
      clearForm();
      EasyLoading.showSuccess("Password reset successful");
      Get.offNamed(AppRoutes.login);

    } else {
      EasyLoading.showError("Please fix the errors");
    }
  }

  void clearForm(){
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

}