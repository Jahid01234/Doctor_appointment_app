import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:doctor_appointment_app/features/book_appointment/model/package_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectPackageController extends GetxController {
  RxString selectedDuration = '30 minutes'.obs;
  RxInt selectedPackageIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxList<PackageModel> packageList = <PackageModel>[].obs;
  final List<String> durations = [
    '30 minutes',
    '45 minutes',
    '60 minutes',
    '90 minutes',
  ];

  final Map<String, double> durationMultiplier = {
    '30 minutes': 1.0,
    '45 minutes': 1.3,
    '60 minutes': 1.6,
    '90 minutes': 2.0,
  };

  @override
  void onInit() {
    super.onInit();
    loadPackageData();
  }


  void loadPackageData() {
    packageList.value = packagesData;
  }

  void selectDuration(String duration) {
    selectedDuration.value = duration;
  }

  void selectPackage(int index) {
    selectedPackageIndex.value = index;
  }

  int getPriceForPackage(int basePrice) {
    final multiplier = durationMultiplier[selectedDuration.value] ?? 1.0;
    return (basePrice * multiplier).round();
  }

  void onSelectedPackage() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.toNamed(AppRoutes.patientDetails);

    Get.snackbar(
      "Package Selected",
      "${packageList[selectedPackageIndex.value].title} • "
          "${selectedDuration.value} • "
          "\$${getPriceForPackage(packageList[selectedPackageIndex.value].price)}",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.lightGreenColor,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }
}