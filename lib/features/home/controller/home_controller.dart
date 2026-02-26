import 'package:doctor_appointment_app/features/home/model/doctor_model.dart';
import 'package:doctor_appointment_app/features/home/model/doctor_specialist_model.dart';
import 'package:doctor_appointment_app/features/home/model/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final TextEditingController searchTextController = TextEditingController();
  RxList<SliderModel> slidersList = <SliderModel>[].obs;
  RxList<DoctorSpecialistModel> specialistList = <DoctorSpecialistModel>[].obs;
  RxList<DoctorModel> allDoctors = <DoctorModel>[].obs;
  RxList<DoctorModel> filteredDoctors = <DoctorModel>[].obs;
  RxString selectedFilter = 'All'.obs;
  RxInt currentIndex = 0.obs;

  RxBool isSearching = false.obs;
  RxString searchQuery = ''.obs;

  final List<String> filterTabs = [
    'All',
    'General',
    'Dentist',
    'Nutritionist',
    'Ophthalmology',
    'Neurology',
    'Surgeon',
    'Pediatrics',
    'Radiology'
  ];


  @override
  void onInit() {
    super.onInit();
    loadSliders();
    loadSpecialistData();
    loadDoctors();
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void loadSliders() {
    slidersList.value = sliders;
  }

  void loadSpecialistData() {
    specialistList.value = specialistData;
  }


  void loadDoctors() {
    allDoctors.value = doctorsData;
    applyFilter('All');
  }

  // Toggle search
  void toggleSearch() {
    isSearching.value = !isSearching.value;
    if (!isSearching.value) {
      searchTextController.clear();
      searchQuery.value = '';
      applyFilter(selectedFilter.value);
    }
  }

  // Filter apply  ..............
  void applyFilter(String filter) {
    selectedFilter.value = filter;

    List<DoctorModel> result;
    if (filter == 'All') {
      result = List.from(allDoctors);
    } else {
      result = allDoctors
          .where((d) => d.department.toLowerCase() == filter.toLowerCase())
          .toList();
    }

    // Highest rating ............
    result.sort((a, b) => b.rating.compareTo(a.rating));
    filteredDoctors.value = result;

    // Search active থাকলে re-apply করো
    if (searchQuery.value.isNotEmpty) {
      searchDoctors(searchQuery.value);
    }
  }

  // Search doctors by name.......................
  void searchDoctors(String query) {
    searchQuery.value = query;

    if (query.isEmpty) {
      applyFilter(selectedFilter.value);
      return;
    }
    final q = query.toLowerCase();

    List<DoctorModel> base = selectedFilter.value == 'All'
        ? List.from(allDoctors)
        : allDoctors
        .where((d) =>
    d.department.toLowerCase() ==
        selectedFilter.value.toLowerCase())
        .toList();

    base.sort((a, b) => b.rating.compareTo(a.rating));

    filteredDoctors.value = base.where((d) {
      return d.name.toLowerCase().contains(q) ||
          d.hospitalName.toLowerCase().contains(q) ||
          d.rating.toString().contains(q);
    }).toList();
  }
}

