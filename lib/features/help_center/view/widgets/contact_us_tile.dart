import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class ContactUsTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const ContactUsTile({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.1),
                  blurRadius: 10,
                  spreadRadius: 4,
                  offset: Offset(0, 0)
              )
            ]
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.lightGreenColor,
            ),
            SizedBox(width: 20),
            Text(
              title,
              style: globalTextStyle(
                  fontSize: 15,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
