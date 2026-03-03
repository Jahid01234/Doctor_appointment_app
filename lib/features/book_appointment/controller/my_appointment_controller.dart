import 'package:doctor_appointment_app/features/book_appointment/model/appointment_model..dart';
import 'package:get/get.dart';

class MyAppointmentController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;
  RxList<AppointmentModel> appointmentList = <AppointmentModel>[].obs;
  final List<String> tabs = ["Upcoming", "Completed", "Cancelled"];

  @override
  void onInit() {
    super.onInit();
    loadAppointmentData();
  }

  void loadAppointmentData() {
    appointmentList.value = appointmentsData;
  }

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }


  List<AppointmentModel> get filteredAppointments {
    return appointmentList
        .where((e) => e.status == tabs[selectedTabIndex.value])
        .toList();
  }

}
