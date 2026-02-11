import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/core/global_widgets/header_section.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/auth/forget_password/controller/set_new_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetNewPasswordScreen extends StatelessWidget {
  SetNewPasswordScreen ({super.key});

  final SetNewPasswordController controller = Get.put(SetNewPasswordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(60)),
              AppBackButton(),
              SizedBox(height: getHeight(80)),
              HeaderSection(title: "Create new password"),
              SizedBox(height: getHeight(10)),
              Text(
                "Your new password must be different form previously used password",
                textAlign: TextAlign.center,
                style: globalTextStyle(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: getHeight(60)),
              Obx(() => CustomTextField(
                obsecureText: controller.isNewPassword.value,
                controller: controller.newPasswordController,
                textInputType: TextInputType.text,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.lock_outline,color: AppColors.greyColor),
                ),
                hinText: "Enter new password",
                errorText: controller.passwordError!.value.isEmpty
                    ? null
                    : controller.passwordError!.value,
                onChanged: controller.validatePassword,
                suffixIcon: IconButton(
                  onPressed: controller.toggleNewPassword,
                  icon: Icon(
                    controller.isNewPassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              ),
              SizedBox(height: getHeight(20)),
              Obx(() => CustomTextField(
                obsecureText: controller.isConfirmPassword.value,
                controller: controller.confirmPasswordController,
                textInputType: TextInputType.text,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.lock_outline,color: AppColors.greyColor),
                ),
                hinText: "Enter confirm password",
                errorText: controller.confirmPasswordError!.value.isEmpty
                    ? null
                    : controller.confirmPasswordError!.value,
                onChanged: controller.validateConfirmPassword,
                suffixIcon: IconButton(
                  onPressed: controller.toggleConfirmPassword,
                  icon: Icon(
                    controller.isConfirmPassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              ),
              SizedBox(height: getHeight(60)),
              Obx(()=>
                  AppPrimaryButton(
                    text: "Reset Password",
                    textColor: AppColors.whiteColor,
                    isLoading: controller.isLoading.value,
                    onTap:(){
                      controller.setNewPassword();
                    },
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}