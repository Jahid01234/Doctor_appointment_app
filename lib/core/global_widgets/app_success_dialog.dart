import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppSuccessDialog extends StatelessWidget {
  final String title;
  final String message;
  final String primaryButtonText;
  final VoidCallback onPrimaryTap;
  final String? secondaryButtonText;
  final VoidCallback? onSecondaryTap;
  final IconData icon;

  const AppSuccessDialog({
    super.key,
    required this.title,
    required this.message,
    required this.primaryButtonText,
    required this.onPrimaryTap,
    this.secondaryButtonText,
    this.onSecondaryTap,
    this.icon = Icons.calendar_month,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 90,
              width: 90,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [AppColors.lightGreenColor, AppColors.greenColor],
                ),
              ),
              child: Icon(icon, color: Colors.white, size: 40),
            ),

            const SizedBox(height: 20),
            Text(
              title,
              style: globalTextStyle(
                fontSize: 20,
                color: AppColors.lightGreenColor,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: globalTextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400
              ),
            ),
            const SizedBox(height: 24),
            AppPrimaryButton(
              height: 45,
              fontSize: 14,
              text: primaryButtonText,
              textColor: AppColors.whiteColor,
              onTap: onPrimaryTap
            ),

            if (secondaryButtonText != null) ...[
              const SizedBox(height: 10),
              AppPrimaryButton(
                  height: 45,
                  fontSize: 14,
                  bgColor: Colors.green.withValues(alpha: 0.4),
                  text: secondaryButtonText!,
                  textColor: AppColors.blackColor,
                  onTap: onSecondaryTap ?? Get.back,
              ),
            ],
          ],
        ),
      ),
    );
  }
}