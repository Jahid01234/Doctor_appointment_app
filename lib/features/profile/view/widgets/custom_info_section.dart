import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/const/images_path.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class CustomInfoSection extends StatelessWidget {
  const CustomInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            ImagesPath.profileImg,
            height: 130,
            width: 130,
            fit: BoxFit.cover,
          ),
          SizedBox(height: getHeight(10)),
          Text(
            "Md. Jahid Hasan",
            style: globalTextStyle(
                fontSize: 18,
                color: AppColors.blackColor,
                fontWeight: FontWeight.w500
            ),
          ),
          Text(
            "jahid@gmail.com",
            style: globalTextStyle(
                fontSize: 15,
                color: AppColors.greyColor,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}
