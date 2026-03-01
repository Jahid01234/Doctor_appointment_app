import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/book_appointment/controller/select_package_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PackageItem extends StatelessWidget {
  final SelectPackageController controller;

  const PackageItem({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final durationText = controller.selectedDuration.value.split(' ').first;

      return Column(
        children: List.generate(controller.packageList.length, (index) {
          final package = controller.packageList[index];
          final isSelected = controller.selectedPackageIndex.value == index;

          final dynamicPrice = controller.getPriceForPackage(package.price);

          return GestureDetector(
            onTap: () => controller.selectPackage(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isSelected
                      ? AppColors.lightGreenColor
                      : Colors.transparent,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: isSelected
                        ? AppColors.lightGreenColor.withValues(alpha: 0.10)
                        : Colors.black.withValues(alpha: 0.05),
                    blurRadius: isSelected ? 12 : 8,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Row(
                children: [
                  /// icon
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: AppColors.lightGreenColor.withValues(alpha: 0.10),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      package.icon,
                      color: AppColors.greyColor,
                      size: 22,
                    ),
                  ),

                  const SizedBox(width: 10),

                  /// title
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          package.title,
                          style: globalTextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: AppColors.blackColor,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          package.subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: globalTextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// price
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$$dynamicPrice',
                        style: globalTextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColors.lightGreenColor,
                        ),
                      ),
                      Text(
                        '/$durationText mins',
                        style: globalTextStyle(
                          fontSize: 11,
                          color: AppColors.greyColor,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(width: 10),

                  /// radio
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
        }),
      );
    });
  }
}
