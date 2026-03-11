import 'dart:math';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/header_see_all_section.dart';
import 'package:doctor_appointment_app/core/global_widgets/section_header.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/article/controller/article_controller.dart';
import 'package:doctor_appointment_app/features/article/view/widgets/article_filter_tab.dart';
import 'package:doctor_appointment_app/features/article/view/widgets/articles_card.dart';
import 'package:doctor_appointment_app/features/article/view/widgets/trending_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArticleScreen extends StatelessWidget {
  ArticleScreen({super.key});

  final ArticleController controller = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SectionHeader(title: "Trending"),
                  ),
                  const SizedBox(height: 12),
                  Obx(
                    () => SizedBox(
                      height: 190,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 20),
                        itemCount: controller.trendingList.length,
                        itemBuilder: (context, index) {
                          final trending = controller.trendingList[index];
                          return TrendingCard(model: trending, onTap: () {});
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: getHeight(30)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: HeaderSeeAllSection(
                      title: "Articles",
                      onTap: () {
                        Get.toNamed(AppRoutes.seeAllArticles);
                      },
                    ),
                  ),
                  SizedBox(height: getHeight(15)),
                  Obx(
                    () => ArticleFilterTab(
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
                          padding: const EdgeInsets.only(top: 40, bottom: 20),
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
                      itemCount: min(3, articles.length),
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        return ArticlesCard(
                          article: article,
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.articleDetails,
                              arguments: article,
                            );
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
