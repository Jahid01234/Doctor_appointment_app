import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/const/icons_path.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/core/global_widgets/header_section.dart';
import 'package:doctor_appointment_app/core/global_widgets/social_media_button.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/auth/register/controller/register_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final RegisterController controller = Get.put(RegisterController());

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
              HeaderSection(title: "Create an Account"),
              SizedBox(height: getHeight(40)),
              CustomTextField(
                controller: controller.userNameController,
                textInputType: TextInputType.text,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.person_outline,color: Colors.grey),
                ),
                hinText: "Enter user name",
              ),
              SizedBox(height: getHeight(20)),
              CustomTextField(
                controller: controller.emailController,
                textInputType: TextInputType.emailAddress,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.mail_outline_rounded,color: Colors.grey),
                ),
                hinText: "Enter email",
              ),
              SizedBox(height: getHeight(20)),
              Obx(() => CustomTextField(
                  obsecureText: controller.isPasswordHidden.value,
                  controller: controller.passwordController,
                  textInputType: TextInputType.text,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Icon(Icons.lock_open,color: Colors.grey),
                  ),
                  hinText: "Enter Password",
                  suffixIcon: IconButton(
                    onPressed: controller.togglePasswordVisibility,
                    icon: Icon(
                      controller.isPasswordHidden.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.greyColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: getHeight(20)),
              Obx(() => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: controller.toggleCheck,
                      child: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(color: AppColors.greyColor, width: 1),
                          color: controller.isChecked.value
                              ? AppColors.whiteColor
                              : Colors.transparent,
                        ),
                        child: controller.isChecked.value
                            ? Icon(Icons.check, size: 16, color: Colors.black)
                            : null,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "By continuing you accept our Privacy Policy and Term of Use",
                        style: globalTextStyle(
                          color: AppColors.greyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: getHeight(60)),
              AppPrimaryButton(
                text: "Register",
                textColor: AppColors.whiteColor,
                onTap: () {
                  //Get.toNamed(AppRoutes.completeProfile);
                  controller.createAccount();
                },
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
                    text: "Already have an account? ",
                    style: globalTextStyle(
                      fontSize: 14,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "Login",
                        style: globalTextStyle(
                          fontSize: 15,
                          color: AppColors.lightGreenColor,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            //Get.toNamed(AppRoutes.login);
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