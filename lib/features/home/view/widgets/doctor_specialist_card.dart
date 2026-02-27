import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/home/model/doctor_specialist_model.dart';
import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

class DoctorSpecialistCard extends StatelessWidget {
  final DoctorSpecialistModel doctorSpecialistModel;

  const DoctorSpecialistCard({
    super.key,
    required this.doctorSpecialistModel,
  });

  bool _isTextOverflowing(String text) {
    return text.length > 10;
    // simple rule (you can adjust based on UI width)
  }

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
              padding: const EdgeInsets.all(18),
              child: Image.asset(
                doctorSpecialistModel.icons,
                fit: BoxFit.contain,
              ),
            ),
          ),

          const SizedBox(height: 6),
          SizedBox(
            height: 16,
            child: _isTextOverflowing(doctorSpecialistModel.title)
                ? Marquee(
              text: doctorSpecialistModel.title,
              style: globalTextStyle(
                fontSize: 14,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500,
              ),
              scrollAxis: Axis.horizontal,
              blankSpace: 20,
              velocity: 30,
              pauseAfterRound: const Duration(seconds: 5),
              startPadding: 5,
              accelerationDuration: const Duration(milliseconds: 500),
              decelerationDuration: const Duration(milliseconds: 500),
            )
                : Text(
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
          ),
        ],
      ),
    );
  }
}