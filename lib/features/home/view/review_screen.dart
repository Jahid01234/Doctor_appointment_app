import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/features/home/model/review_model.dart';
import 'package:flutter/material.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/review_card.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:get/get.dart';

class ReviewsScreen extends StatelessWidget {
    ReviewsScreen({super.key});

  final List<ReviewModel> reviews = Get.arguments as List<ReviewModel>;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Reviews"),
            const SizedBox(height: 20),
            Expanded(
              child: reviews.isEmpty
                  ? Center(
                      child: Text(
                        "No reviews found",
                        style: globalTextStyle(
                          fontSize: 14,
                          color: AppColors.greyColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.zero,
                      itemCount: reviews.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 5),
                      itemBuilder: (context, index) {
                        final review = reviews[index];
                        return ReviewCard(
                          reviewerName: review.userName,
                          reviewerImage: review.userImage,
                          rating: review.rating,
                          reviewText: review.comment,
                          reviewDate: review.date,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
