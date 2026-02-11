import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/const/icons_path.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/core/global_widgets/header_section.dart';
import 'package:doctor_appointment_app/core/global_widgets/social_media_button.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/auth/login/controller/login_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());

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
              SizedBox(height: getHeight(70)),
              HeaderSection(title: "Login to your account"),
              SizedBox(height: getHeight(40)),
              Obx(() => CustomTextField(
                controller: controller.emailController,
                hinText: "Enter email",
                textInputType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.mail_outline,color: AppColors.greyColor),
                errorText: controller.emailError!.value.isEmpty
                    ? null
                    : controller.emailError!.value,
                onChanged: controller.validateEmail,
              )),
              SizedBox(height: getHeight(20)),
              Obx(() => CustomTextField(
                obsecureText: controller.isPasswordHidden.value,
                controller: controller.passwordController,
                textInputType: TextInputType.text,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.lock_outline,color: AppColors.greyColor),
                ),
                hinText: "Enter Password",
                errorText: controller.passwordError!.value.isEmpty
                    ? null
                    : controller.passwordError!.value,
                onChanged: controller.validatePassword,
                suffixIcon: IconButton(
                  onPressed: controller.togglePasswordVisibility,
                  icon: Icon(
                    controller.isPasswordHidden.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    color: AppColors.greyColor,
                  ),
                ),
              ),
              ),
              SizedBox(height: getHeight(20)),
               Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                       Get.toNamed(AppRoutes.forgetPassword);
                    },
                    child: Text(
                      "Forget your password?",
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                        decorationColor: AppColors.lightGreenColor,
                        color: AppColors.lightGreenColor.withValues(alpha: 0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              SizedBox(height: getHeight(60)),
              Obx(()=>
                  AppPrimaryButton(
                    text: "Login",
                    textColor: AppColors.whiteColor,
                    isLoading: controller.isLoading.value,
                    onTap:(){
                      controller.loginAccount();
                    },
                  ),
              ),
              SizedBox(height: getHeight(60)),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.greyColor.withValues(alpha: 0.5),
                    ),
                  ),
                  Text(
                    " Or Continue With ",
                    style: globalTextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.greyColor.withValues(alpha: 0.5),
                    ),
                  ),
                ],
              ),
              SizedBox(height: getHeight(20)),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SocialMediaButton(image: IconsPath.facebook, onTap: () {}),
                    SizedBox(width: getWidth(40)),
                    SocialMediaButton(image: IconsPath.google, onTap: () {}),
                    SizedBox(width: getWidth(40)),
                    SocialMediaButton(image: IconsPath.apple, onTap: () {}),
                  ],
                ),
              ),
              SizedBox(height: getHeight(30)),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Create a new account? ",
                    style: globalTextStyle(
                      fontSize: 14,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Register",
                        style: globalTextStyle(
                          fontSize: 15,
                          color: AppColors.lightGreenColor,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                             Get.toNamed(AppRoutes.register);
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}