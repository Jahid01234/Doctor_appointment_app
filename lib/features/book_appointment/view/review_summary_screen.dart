import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/features/book_appointment/controller/review_summary_controller.dart';
import 'package:doctor_appointment_app/features/book_appointment/view/widgets/dr_profile_card.dart';
import 'package:doctor_appointment_app/features/book_appointment/view/widgets/info_row.dart';
import 'package:doctor_appointment_app/features/book_appointment/view/widgets/summary_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewSummaryScreen extends StatelessWidget {
  ReviewSummaryScreen({super.key});

  final ReviewSummaryController controller = Get.put(ReviewSummaryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Review Summary"),
            SizedBox(height: getHeight(30)),
            DrProfileCard(),
            SizedBox(height: getHeight(60)),
            SummaryCard(
              children: const [
                InfoRow(title: "Date & Hour", value: "Dec 23, 2024 | 10:00 AM"),
                InfoRow(title: "Package", value: "Messaging"),
                InfoRow(title: "Duration", value: "30 minutes"),
              ],
            ),
            SizedBox(height: getHeight(40)),
            SummaryCard(
              children: const [
                InfoRow(title: "Amount", value: "\$20"),
                InfoRow(title: "Duration (30 mins)", value: "1 x \$20"),
                Divider(),
                InfoRow(title: "Total", value: "\$20"),
              ],
            ),
            SizedBox(height: getHeight(100)),
            Obx(() => AppPrimaryButton(
              text: "Next",
              textColor: AppColors.whiteColor,
              isLoading: controller.isLoading.value,
              onTap: () {
                controller.reviewSummaryMethod();
              },
            ),
            ),
          ],
        ),
      ),
    );
  }
}


