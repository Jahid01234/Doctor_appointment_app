import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController{
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  RxBool isLoading = false.obs;

  RxBool isCurrentPassword = true.obs;
  RxBool isNewPassword = true.obs;
  RxBool isConfirmPassword = true.obs;

  void toggleCurrentPassword(){
    isCurrentPassword.value = !isCurrentPassword.value;
  }

  void toggleNewPassword(){
    isNewPassword.value = !isNewPassword.value;
  }

  void toggleConfirmPassword(){
    isConfirmPassword.value = !isConfirmPassword.value;
  }


  RxString? currentPasswordError = RxString('');
  RxString? newPasswordError = RxString('');
  RxString? confirmPasswordError = RxString('');



  void validateCurrentPassword(String value) {
    if (value.isEmpty) {
      currentPasswordError!.value = "Current password required";
    } else if (value.length < 8) {
      currentPasswordError!.value = "Minimum 8 characters";
    } else {
      currentPasswordError!.value = '';
    }
  }

  void validateNewPassword(String value) {
    if (value.isEmpty) {
      newPasswordError!.value = "New password required";
    } else if (value.length < 8) {
      newPasswordError!.value = "Minimum 8 characters";
    } else {
      newPasswordError!.value = '';
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




  Future<void> changePassword() async {
    // Validate all fields
    validateCurrentPassword(currentPasswordController.text);
    validateNewPassword(newPasswordController.text);
    validateConfirmPassword(confirmPasswordController.text);


    // If all validations pass
    if (
    currentPasswordError!.value.isEmpty &&
        newPasswordError!.value.isEmpty &&
        confirmPasswordError!.value.isEmpty
    ) {
      // Start loading
      isLoading.value = true;

      // Simulate API call (replace with your actual API call)
      await Future.delayed(Duration(seconds: 3));

      // Stop loading
      isLoading.value = false;
      clearForm();
      EasyLoading.showSuccess("Password change successful");
      Get.offNamed(AppRoutes.login);

    } else {
      EasyLoading.showError("Please fix the errors");
    }
  }

  void clearForm(){
    currentPasswordController.clear();
    newPasswordController.clear();
    confirmPasswordController.clear();
  }

  @override
  void dispose() {
    currentPasswordController.clear();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

}