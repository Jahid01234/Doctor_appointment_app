import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/images_path.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final String title;

  const HeaderSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagesPath.appImg,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10),
          Text(
            title,
            style: globalTextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
}
