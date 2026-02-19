import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/help_center/controller/faq_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqTabScreen extends StatelessWidget {
      FaqTabScreen({super.key});

  final FaqTabController controller = Get.put(FaqTabController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                final category = controller.categories[index];
                return Obx(() {
                  final isSelected = controller.selectedCategory.value == category;
                  return GestureDetector(
                    onTap: () => controller.selectCategoryMethod(category),
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.lightGreenColor
                            : Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: AppColors.lightGreenColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          category,
                          style: globalTextStyle(
                            fontSize: 15,
                            color: isSelected
                                ? Colors.white
                                : AppColors.lightGreenColor,
                            fontWeight: isSelected
                                ? FontWeight.w400
                                : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CustomTextField(
              controller: controller.searchController,
              onChanged: controller.onSearchChanged,
              hinText: "Search.....",
              textInputType: TextInputType.text,
              prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.greyColor,
              ),
            ),
          ),

          Expanded(
            child: Obx(() {
              final faqs = controller.filteredFaqs;

              if (faqs.isEmpty) {
                return Center(
                  child: Text(
                    'No results found',
                    style: globalTextStyle(fontSize: 14),
                  ),
                );
              }

              return ListView.builder(
                itemCount: faqs.length,
                itemBuilder: (context, index) {
                  final faq = faqs[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20, bottom: 12),
                    child: Obx(() => GestureDetector(
                      onTap: () => controller.toggleFaq(faq),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: AppColors.lightGreenColor.withValues(alpha: 0.4),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.04),
                              blurRadius: 6,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Question...........
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    faq.question,
                                    style: globalTextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                AnimatedRotation(
                                  turns: faq.isExpanded.value ? 0.5 : 0,
                                  duration: const Duration(milliseconds: 300),
                                  child: const Icon(Icons.keyboard_arrow_down),
                                )
                              ],
                            ),

                            // Answer...........
                            AnimatedCrossFade(
                              duration: const Duration(milliseconds: 250),
                              crossFadeState: faq.isExpanded.value
                                  ? CrossFadeState.showSecond
                                  : CrossFadeState.showFirst,
                              firstChild: const SizedBox.shrink(),
                              secondChild: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  faq.answer,
                                  style: globalTextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  );
                },
              );
            }),
          ),
        ],
      )
    );
  }
}
