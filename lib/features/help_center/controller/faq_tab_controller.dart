import 'package:doctor_appointment_app/features/help_center/model/faq_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqTabController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  final RxString selectedCategory = 'General'.obs;
  final List<String> categories = ['General', 'Account', 'Service', 'Payment'];
  final RxList<FaqModel> filteredFaqs = <FaqModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    applyFilter();
  }

  void selectCategoryMethod(String category) {
    selectedCategory.value = category;
    applyFilter();
  }

  void onSearchChanged(String value) {
    applyFilter();
  }

  void toggleFaq(FaqModel selectedFaq) {
    for (var faq in filteredFaqs) {
      if (faq == selectedFaq) {
        faq.isExpanded.toggle();
      } else {
        faq.isExpanded.value = false;
      }
    }
  }


  void applyFilter() {
    final query = searchController.text.toLowerCase();

    final result = allFaqsModel.where((faq) {
      final matchCategory = faq.category == selectedCategory.value;
      final matchSearch =
          faq.question.toLowerCase().contains(query) ||
              faq.answer.toLowerCase().contains(query);
      return matchCategory && matchSearch;
    }).toList();

    /// collapse all when filter changes
    for (var faq in result) {
      faq.isExpanded.value = false;
    }
    filteredFaqs.assignAll(result);
  }


}

