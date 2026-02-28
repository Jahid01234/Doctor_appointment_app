import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/book_appointment/controller/select_package_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DurationBottomSheet extends StatelessWidget {
  final SelectPackageController controller;
  const DurationBottomSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => GestureDetector(
        onTap: () => _showDurationPicker(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.03),
                blurRadius: 10,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            children: [
              const Icon(
                Icons.access_time_rounded,
                color: AppColors.lightGreenColor,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  controller.selectedDuration.value,
                  style: globalTextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
              const Icon(Icons.keyboard_arrow_down_rounded),
            ],
          ),
        ),
      ),
    );
  }

  void _showDurationPicker(BuildContext context) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 5,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
            ),

            Text(
              "Select Duration",
              style: globalTextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            const SizedBox(height: 20),
            ...controller.durations.map((duration) {
              return Obx(
                () => ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    duration,
                    style: globalTextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: controller.selectedDuration.value == duration
                      ? const Icon(
                          Icons.check_circle,
                          color: AppColors.lightGreenColor,
                        )
                      : null,
                  onTap: () {
                    controller.selectDuration(duration);
                    Get.back();
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
