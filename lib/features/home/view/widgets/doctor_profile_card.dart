import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/home/model/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorProfileCard extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorProfileCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            doctor.image,
            width: 90,
            height: 90,
            fit: BoxFit.contain,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                doctor.name,
                style: globalTextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              Divider(
                color: AppColors.greyColor.withValues(alpha: 0.15),
                thickness: 1,
              ),
              Text(
                doctor.department,
                style: globalTextStyle(
                    color: AppColors.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: 4),
              Text(
                doctor.hospitalName,
                style: globalTextStyle(
                  color: AppColors.greyColor,
                  fontSize: 14,
                    fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}