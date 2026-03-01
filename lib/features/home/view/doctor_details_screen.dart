import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/header_see_all_section.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/home/model/doctor_model.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/doctor_profile_card.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/doctor_status_row.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/review_card.dart';
import 'package:doctor_appointment_app/core/global_widgets/section_header.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorDetailsScreen extends StatelessWidget {
  DoctorDetailsScreen({super.key});

  final DoctorModel doctor = Get.arguments as DoctorModel;
  final RxBool isLoading = false.obs;

  void _bookAppointment() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    Get.toNamed(AppRoutes.dateAndTimePicker);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Doctor Details"),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorProfileCard(doctor: doctor),
                    const SizedBox(height: 24),
                    DoctorStatsRow(doctor: doctor),
                    const SizedBox(height: 24),
                    const SectionHeader(title: 'About me'),
                    const SizedBox(height: 5),
                    ExpandableText(
                      doctor.description,
                      expandText: 'Read more',
                      collapseText: 'Read less',
                      maxLines: 4,
                      linkColor: AppColors.lightGreenColor,
                      style: globalTextStyle(
                        fontSize: 14,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const SectionHeader(title: 'Working Time'),
                    const SizedBox(height: 5),
                    Text(
                      doctor.workingSchedule,
                      style: globalTextStyle(
                        fontSize: 14,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                    HeaderSeeAllSection(
                      title: "Reviews",
                      onTap: () {
                        Get.toNamed(
                            AppRoutes.doctorReviews,
                            arguments: doctor.reviews,
                        );
                      },
                    ),
                    const SizedBox(height: 10),
                    doctor.reviews.isEmpty
                        ? Text(
                            "No review data found",
                            style: globalTextStyle(
                              fontSize: 14,
                              color: AppColors.greyColor,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        : ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: doctor.reviews.length,
                            itemBuilder: (context, index) {
                              final review = doctor.reviews[index];
                              return ReviewCard(
                                reviewerName: review.userName,
                                reviewerImage: review.userImage,
                                rating: review.rating,
                                reviewText: review.comment,
                                reviewDate: review.date,
                              );
                            },
                          ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),

            // Book Appointment Button
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Obx(
                    () => AppPrimaryButton(
                  text: "Book Appointment",
                  isLoading: isLoading.value,
                  textColor: Colors.white,
                  onTap: (){
                    _bookAppointment();
                    },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
