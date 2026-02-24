import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class HeaderSeeAllSection extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const HeaderSeeAllSection({
    super.key,
    this.onTap,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: globalTextStyle(
              fontSize: 18,
              color: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              "See All",
              style: globalTextStyle(
                fontSize: 15,
                color: AppColors.lightGreenColor,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
