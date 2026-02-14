import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_field_title.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/core/global_widgets/header_section.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/auth/forget_password/controller/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen ({super.key});

  final ForgetPasswordController controller = Get.put(ForgetPasswordController());

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
              HeaderSection(title: "Forget Password?"),
              SizedBox(height: getHeight(10)),
              Text(
                "Enter your Email, we will send you a verification code.",
                textAlign: TextAlign.center,
                style: globalTextStyle(
                  color: AppColors.greyColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: getHeight(60)),
              CustomFieldTitle(title: "Email"),
              SizedBox(height: 4),
              Obx(() => CustomTextField(
                controller: controller.emailEditingController,
                hinText: "Enter email",
                textInputType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.mail_outline,color: AppColors.greyColor),
                errorText: controller.emailError!.value.isEmpty
                    ? null
                    : controller.emailError!.value,
                onChanged: controller.validateEmail,
              )),
              SizedBox(height: getHeight(60)),
              Obx(()=>
                  AppPrimaryButton(
                    text: "Send Code",
                    textColor: AppColors.whiteColor,
                    isLoading: controller.isLoading.value,
                    onTap:(){
                      controller.sendEmail();
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