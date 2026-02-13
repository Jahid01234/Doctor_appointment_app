import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class ProfileComponentTile extends StatelessWidget {
  final IconData icon;
  final Color? iconColor;
  final String title;
  final String? trailingText;
  final bool showSwitch;
  final bool switchValue;
  final Function(bool)? onSwitchChanged;
  final VoidCallback? onTap;
  final Color? titleColor;

  const ProfileComponentTile({
    super.key,
    required this.icon,
    this.iconColor,
    required this.title,
    this.trailingText,
    this.showSwitch = false,
    this.switchValue = false,
    this.onSwitchChanged,
    this.onTap,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: showSwitch ? null : onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric( vertical: 14),
        child: Row(
          children: [
            Icon(
                icon,
                size: 22,
                color: iconColor ?? Colors.black54,
            ),
            const SizedBox(width: 16),

            // Title..........
            Expanded(
              child: Text(
                title,
                style: globalTextStyle(
                  fontSize: 15,
                  color: titleColor ?? AppColors.blackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Trailing Text (Language etc.).........
            if (trailingText != null)
              Text(
                trailingText!,
                style: globalTextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                ),
              ),

            // Switch................
            if (showSwitch)
              Switch(
                value: switchValue,
                onChanged: onSwitchChanged,
                activeThumbColor: AppColors.whiteColor,
                activeTrackColor: AppColors.lightGreenColor,
                inactiveThumbColor: AppColors.whiteColor,
                inactiveTrackColor: AppColors.greyColor.withValues(alpha: 0.3),
                trackOutlineColor: WidgetStateColor.transparent,
              ),

            // Arrow.............
            if (!showSwitch)
              const Icon(
                  Icons.arrow_forward_ios,
                  size: 18 ,
                  color: Colors.black38,
              ),
          ],
        ),
      ),
    );
  }
}