import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/help_center/controller/help_center_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarSection extends StatelessWidget {
  final HelpCenterController controller;

  const TabBarSection({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
      return Obx(() => Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          children: [
            _tabItem('FAQ', 0),
            _tabItem('Contact us', 1),
          ],
        ),
      ));
    }

    Widget _tabItem(String label, int index) {
      final isSelected = controller.selectedTabIndex.value == index;
      return Expanded(
        child: GestureDetector(
          onTap: () => controller.selectTab(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected
                      ? AppColors.lightGreenColor
                      : Colors.grey.shade200,
                  width: 2.5,
                ),
              ),
            ),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: globalTextStyle(
                fontSize: 15,
                fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w500,
                color: isSelected
                            ? AppColors.lightGreenColor
                            : Colors.grey,
              ),
            ),
          ),
        ),
      );
    }
}
