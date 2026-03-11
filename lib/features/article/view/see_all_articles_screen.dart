import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/article/controller/article_controller.dart';
import 'package:doctor_appointment_app/features/article/view/widgets/article_filter_tab.dart';
import 'package:doctor_appointment_app/features/article/view/widgets/articles_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAllArticlesScreen extends StatelessWidget {
  SeeAllArticlesScreen ({super.key});

  final ArticleController controller = Get.put(ArticleController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getHeight(60)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppBackButton(
              title: "Articles",
            ),
          ),
          SizedBox(height: getHeight(30)),
          Obx(() => ArticleFilterTab(
            tabs: controller.filterTabs,
            selectedTab: controller.selectedFilter.value,
            onTabSelected: controller.applyFilter,
           ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Obx(() {
              final articles = controller.filteredArticles;
              if (articles.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 40,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'No articles found',
                        style: globalTextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ArticlesCard(
                    article: article,
                    onTap: () {
                       Get.toNamed(AppRoutes.articleDetails,arguments: article);
                    },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}