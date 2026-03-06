import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/core/global_widgets/section_header.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/book_appointment/controller/reschedule_reason_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RescheduleReasonScreen extends StatelessWidget {
  RescheduleReasonScreen({super.key});

  final RescheduleReasonController controller = Get.put(
    RescheduleReasonController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Reschedule Reason"),
            SizedBox(height: getHeight(30)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(title: 'Reason for Schedule Change'),
                    const SizedBox(height: 16),
                    Obx(
                      () => Column(
                        children: List.generate(
                          controller.reasons.length,
                          (index) => GestureDetector(
                            onTap: () => controller.selectReason(index),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8
                              ),
                              child: Row(
                                children: [
                                  AnimatedSwitcher(
                                    duration: const Duration(milliseconds: 200),
                                    child:
                                        controller.selectedIndex.value == index
                                        ? const Icon(
                                            Icons.radio_button_checked,
                                            key: ValueKey('checked'),
                                            color: AppColors.lightGreenColor,
                                            size: 24,
                                          )
                                        : const Icon(
                                            Icons.radio_button_unchecked,
                                            key: ValueKey('unchecked'),
                                            color: AppColors.lightGreenColor,
                                            size: 24,
                                          ),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      controller.reasons[index],
                                      style: globalTextStyle(
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),
                    Obx(
                      () => AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: controller.isOthersSelected
                            ? CustomTextField(
                                controller: controller.othersReasonController,
                                hinText: "Write your reason here...",
                                textInputType: TextInputType.text,
                                maxLines: 6,
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                    Obx(() {
                      return SizedBox(
                        height: controller.isOthersSelected
                            ? getHeight(140)
                            : getHeight(350),
                      );
                    }),
                    Obx(
                      () => AppPrimaryButton(
                        text: "Next",
                        textColor: AppColors.whiteColor,
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          controller.rescheduleReasonMethod();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
