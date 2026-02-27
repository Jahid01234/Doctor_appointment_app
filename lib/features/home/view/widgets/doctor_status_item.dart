import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class DoctorStatItem extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const DoctorStatItem({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.lightGreenColor.withValues(alpha: 0.08),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: AppColors.lightGreenColor, size: 22),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: globalTextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
            color: AppColors.blackColor,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: globalTextStyle(
              color: AppColors.greyColor,
              fontSize: 13,
              fontWeight: FontWeight.w400
          ),
        ),
      ],
    );
  }
}