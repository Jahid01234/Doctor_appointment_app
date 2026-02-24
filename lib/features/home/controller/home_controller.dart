import 'package:doctor_appointment_app/features/home/model/doctor_specialist_model.dart';
import 'package:doctor_appointment_app/features/home/model/slider_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  RxList<SliderModel> slidersList = <SliderModel>[].obs;
  RxList<DoctorSpecialistModel> specialistList = <DoctorSpecialistModel>[].obs;
  RxInt currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadSliders();
    loadSpecialistData();
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

}