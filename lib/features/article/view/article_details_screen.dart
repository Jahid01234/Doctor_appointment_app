import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/article/model/article_model.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleDetailsScreen extends StatelessWidget {
   ArticleDetailsScreen({super.key});

  final ArticleModel article = Get.arguments as ArticleModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Article Details"),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        article.image,
                        width: double.infinity,
                        height: 200,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
                          decoration: BoxDecoration(
                              color: AppColors.lightGreenColor.withValues(alpha: 0.08),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Text(
                            article.tag,
                            style: globalTextStyle(
                              fontSize: 12,
                              color: AppColors.greyColor,
                            ),
                          ),
                        ),

                        const SizedBox(width: 4),
                        Text(
                          article.dateTime,
                          style: globalTextStyle(
                            fontSize: 12,
                            color: AppColors.greyColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Divider(height: 1,color: Colors.grey.shade200),
                    const SizedBox(height: 10),
                    ExpandableText(
                      article.description,
                      expandText: 'Read more',
                      collapseText: 'Read less',
                      maxLines: 20,
                      linkColor: AppColors.lightGreenColor,
                      style: globalTextStyle(
                        fontSize: 14,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const SizedBox(height: 5),
                    const SizedBox(height: 24),
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