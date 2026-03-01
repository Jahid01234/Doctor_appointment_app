import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_field_title.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/features/book_appointment/controller/patient_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PatientDetailsScreen extends StatelessWidget {
  PatientDetailsScreen ({super.key});

  final PatientDetailsController controller = Get.put(
    PatientDetailsController(),
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
            AppBackButton(title: "Patient Details"),
            SizedBox(height: getHeight(20)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight(40)),
                    CustomFieldTitle(title: "Full Name"),
                    SizedBox(height: 4),
                    CustomTextField(
                      controller: controller.nameController,
                      hinText: "Enter Name",
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 20),
                    CustomFieldTitle(title: "Gender"),
                    SizedBox(height: 4),
                    CustomTextField(
                      controller: controller.genderController,
                      hinText: "Enter Gender",
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 20),
                    CustomFieldTitle(title: "Your Age"),
                    SizedBox(height: 4),
                    CustomTextField(
                      controller: controller.ageController,
                      hinText: "Enter age",
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    CustomFieldTitle(title: "Write Your Problem"),
                    SizedBox(height: 4),
                    CustomTextField(
                      controller: controller.problemDesController,
                      hinText: "Enter your problem",
                      textInputType: TextInputType.text,
                      maxLines: 6,
                    ),

                    SizedBox(height: getHeight(90)),
                    Obx(
                      () => AppPrimaryButton(
                        text: "Next",
                        textColor: AppColors.whiteColor,
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          controller.setPatientsDetailsMethod();
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
