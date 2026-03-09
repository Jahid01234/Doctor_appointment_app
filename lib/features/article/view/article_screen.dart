import 'dart:math';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/header_see_all_section.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/article/controller/article_controller.dart';
import 'package:doctor_appointment_app/features/article/view/widgets/article_filter_tab.dart';
import 'package:doctor_appointment_app/features/article/view/widgets/articles_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleScreen extends StatelessWidget {
   ArticleScreen({super.key});

   final ArticleController controller = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getHeight(60)),
          AppBackButton(
            title: "Articles",
            showBackButton: Get.key.currentState!.canPop(),
          ),
          SizedBox(height: getHeight(30)),
          Expanded(
            child: SingleChildScrollView(
                child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: HeaderSeeAllSection(
                          title: "Articles",
                          onTap: () {
                            //Get.toNamed(AppRoutes.topDoctor);
                          },
                        ),
                      ),
                      SizedBox(height: getHeight(12)),
                      Obx(() => ArticleFilterTab(
                        tabs: controller.filterTabs,
                        selectedTab: controller.selectedFilter.value,
                        onTabSelected: controller.applyFilter,
                      ),
                      ),
                      SizedBox(height: getHeight(15)),
                      Obx(() {
                        final articles = controller.filteredArticles;
                        if (articles.isEmpty) {
                          return Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 40,bottom: 20),
                              child: Text(
                                "No doctors found",
                                style: globalTextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: min(3,articles.length),
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            return ArticlesCard(
                              article: article,
                              onTap: () {
                                //Get.toNamed(AppRoutes.doctorDetails,arguments: doctor);
                              },
                            );
                          },
                        );
                      }),
                    ],
                ),
            ),
          ),
        ],
      ),
    );
  }
}
