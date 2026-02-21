import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/language/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageTile extends StatelessWidget {
  final String lang;
  final LanguageController controller;

  const LanguageTile({
    super.key,
    required this.lang,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isSelected = controller.selectedLanguage.value == lang;
      return GestureDetector(
        onTap: () => controller.selectLanguage(lang),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  lang,
                  style: globalTextStyle(
                    fontSize: 15,
                    fontWeight:
                    isSelected ? FontWeight.w500 : FontWeight.w400,
                    color: Colors.black87,
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: isSelected
                    ? const Icon(
                        Icons.radio_button_checked,
                        key: ValueKey('checked'),
                        color: AppColors.lightGreenColor,
                        size: 22,
                      )
                    : const Icon(
                      Icons.radio_button_unchecked,
                      key: ValueKey('unchecked'),
                      color: AppColors.lightGreenColor,
                      size: 22,
                    ),
              ),
            ],
          ),
        ),
      );
    });
  }
}