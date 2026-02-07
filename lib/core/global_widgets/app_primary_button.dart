import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:flutter/material.dart';


class AppPrimaryButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Color? bgColor;
  final Function()? onTap;

  const AppPrimaryButton({
    super.key,
    this.height,
    this.width,
    this.bgColor,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 57,
        width: width ?? 157,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor ?? AppColors.lightGreenColor,
        ),
        child:  Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}