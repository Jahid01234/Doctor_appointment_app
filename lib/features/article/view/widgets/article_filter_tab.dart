import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class ArticleFilterTab extends StatelessWidget {
  final List<String> tabs;
  final String selectedTab;
  final Function(String) onTabSelected;

  const ArticleFilterTab ({
    super.key,
    required this.tabs,
    required this.selectedTab,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 20),
        itemCount: tabs.length,
        separatorBuilder: (_, __) => const SizedBox(width: 10),
        itemBuilder: (context, index) {
          final tab = tabs[index];
          final isSelected = tab == selectedTab;
          return GestureDetector(
            onTap: () => onTabSelected(tab),
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
                  tab,
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
        },
      ),
    );
  }
}