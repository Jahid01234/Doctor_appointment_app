import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/home/model/doctor_specialist_model.dart';
import 'package:flutter/material.dart';

class DoctorSpecialistCard extends StatelessWidget {
  final DoctorSpecialistModel doctorSpecialistModel;

  const DoctorSpecialistCard({
    super.key,
    required this.doctorSpecialistModel,
  });



  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: AppColors.lightGreenColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Image.asset(
                doctorSpecialistModel.icons,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            doctorSpecialistModel.title,
            maxLines: 1,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: globalTextStyle(
              fontSize: 14,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}