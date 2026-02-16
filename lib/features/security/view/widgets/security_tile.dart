import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecurityTile extends StatelessWidget {
  final String title;
  final RxBool? switchValue;
  final Function(bool)? onChanged;
  final bool showArrow;
  final VoidCallback? onTap;

  const SecurityTile ({
    super.key,
    required this.title,
    this.switchValue,
    this.onChanged,
    this.showArrow = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                title,
                style: globalTextStyle(
                  fontSize: 15,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Switch....................
            if (switchValue != null)
              Obx(() => Switch(
                value: switchValue!.value,
                onChanged: onChanged,
                activeThumbColor: AppColors.whiteColor,
                activeTrackColor: AppColors.lightGreenColor,
                inactiveThumbColor: AppColors.whiteColor,
                inactiveTrackColor: AppColors.greyColor.withValues(alpha: 0.3),
                trackOutlineColor: WidgetStateColor.transparent,
               ),
              ),

            // Arrow.....................
            if (showArrow)
              const Icon(Icons.chevron_right, color: Colors.grey,size: 35,),
          ],
        ),
      ),
    );
  }
}