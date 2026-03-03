import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/book_appointment/controller/my_appointment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentTabBarSection extends StatelessWidget {
  final MyAppointmentController controller;

  const AppointmentTabBarSection ({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Row(
        children: List.generate(
          controller.tabs.length,
              (index) {
            final isSelected =
                controller.selectedTabIndex.value == index;

            return Expanded(
              child: GestureDetector(
                onTap: () => controller.changeTab(index),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  padding:
                  const EdgeInsets.symmetric(vertical: 12),
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
                    controller.tabs[index],
                    textAlign: TextAlign.center,
                    style: globalTextStyle(
                      fontSize: 15,
                      fontWeight:
                      isSelected ? FontWeight.w700 : FontWeight.w500,
                      color: isSelected
                          ? AppColors.lightGreenColor
                          : Colors.grey,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}