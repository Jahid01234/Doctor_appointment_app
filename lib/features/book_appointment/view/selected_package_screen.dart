import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/section_header.dart';
import 'package:doctor_appointment_app/features/book_appointment/controller/select_package_controller.dart';
import 'package:doctor_appointment_app/features/book_appointment/view/widgets/duration_bottom_sheet.dart';
import 'package:doctor_appointment_app/features/book_appointment/view/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPackageScreen extends StatelessWidget {
  SelectPackageScreen({super.key});

  final SelectPackageController controller = Get.put(SelectPackageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Select Package"),
            SizedBox(height: getHeight(30)),
            const SectionHeader(title: 'Select Duration'),
            SizedBox(height: getHeight(12)),
            DurationBottomSheet(controller: controller),
            SizedBox(height: getHeight(60)),
            const SectionHeader(title: 'Select Package'),
            SizedBox(height: getHeight(12)),
            PackageItem(controller: controller),
            SizedBox(height: getHeight(220)),
            Obx(() => AppPrimaryButton(
                text: "Next",
                textColor: AppColors.whiteColor,
                isLoading: controller.isLoading.value,
                onTap: () {
                    controller.onSelectedPackage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


