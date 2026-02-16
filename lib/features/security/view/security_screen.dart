import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:doctor_appointment_app/features/security/controller/security_controller.dart';
import 'package:doctor_appointment_app/features/security/view/widgets/security_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityScreen extends StatelessWidget {
  SecurityScreen ({super.key});

  final SecurityController controller = Get.put(SecurityController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Security",),
            SizedBox(height: getHeight(30)),
            SecurityTile(
              title: "Remember me",
              switchValue: controller.rememberMe,
              onChanged: controller.toggleRememberMe,
            ),
            SecurityTile(
              title: "Face ID",
              switchValue: controller.faceId,
              onChanged: controller.toggleFaceId,
            ),
            SecurityTile(
              title: "Biometric ID",
              switchValue: controller.biometricId,
              onChanged: controller.toggleBiometricId,
            ),
            SecurityTile(
              title: "Google Authenticator",
              showArrow: true,
              onTap: controller.enableGoogleAuth,
            ),
            SizedBox(height: getHeight(100)),
            AppPrimaryButton(
              text: "Change Pin",
              textColor: AppColors.whiteColor,
              onTap: controller.changePin
            ),
            SizedBox(height: getHeight(30)),
            AppPrimaryButton(
              text: "Change Password",
              textColor: AppColors.whiteColor,
              onTap:(){
                 Get.toNamed(AppRoutes.changePassword);
              },
            ),
          ],
        ),
      ),
    );
  }
}