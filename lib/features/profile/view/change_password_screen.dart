import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_field_title.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/features/profile/controller/change_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});

  final ChangePasswordController controller = Get.put(
    ChangePasswordController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Change Password"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight(140)),
                    CustomFieldTitle(title: "Current password"),
                    SizedBox(height: 4),
                    Obx(
                      () => CustomTextField(
                        obsecureText: controller.isCurrentPassword.value,
                        controller: controller.currentPasswordController,
                        textInputType: TextInputType.text,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.lock_outline,
                            color: AppColors.greyColor,
                          ),
                        ),
                        hinText: "Enter current password",
                        errorText:
                            controller.currentPasswordError!.value.isEmpty
                            ? null
                            : controller.currentPasswordError!.value,
                        onChanged: controller.validateCurrentPassword,
                        suffixIcon: IconButton(
                          onPressed: controller.toggleCurrentPassword,
                          icon: Icon(
                            controller.isCurrentPassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: getHeight(20)),
                    CustomFieldTitle(title: "New password"),
                    SizedBox(height: 4),
                    Obx(
                      () => CustomTextField(
                        obsecureText: controller.isNewPassword.value,
                        controller: controller.newPasswordController,
                        textInputType: TextInputType.text,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.lock_outline,
                            color: AppColors.greyColor,
                          ),
                        ),
                        hinText: "Enter new password",
                        errorText: controller.newPasswordError!.value.isEmpty
                            ? null
                            : controller.newPasswordError!.value,
                        onChanged: controller.validateNewPassword,
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
                    CustomFieldTitle(title: "Confirm password"),
                    SizedBox(height: 4),
                    Obx(
                      () => CustomTextField(
                        obsecureText: controller.isConfirmPassword.value,
                        controller: controller.confirmPasswordController,
                        textInputType: TextInputType.text,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.lock_outline,
                            color: AppColors.greyColor,
                          ),
                        ),
                        hinText: "Enter confirm password",
                        errorText:
                            controller.confirmPasswordError!.value.isEmpty
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
                    Obx(
                      () => AppPrimaryButton(
                        text: "Change Password",
                        textColor: AppColors.whiteColor,
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          controller.changePassword();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
