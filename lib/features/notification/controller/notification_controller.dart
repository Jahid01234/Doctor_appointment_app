import 'package:doctor_appointment_app/features/notification/model/notification_model.dart';
import 'package:get/get.dart';

class NotificationController extends GetxController {
  RxList notificationList = <NotificationModel>[].obs;
  final RxMap<int, bool> expandedStates = <int, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    dummyNotification();
  }

  void dummyNotification() {
    notificationList.addAll(notificationData);
  }

  // Toggle function
  void toggleExpand(int index) {
    expandedStates[index] = !(expandedStates[index] ?? false);
  }

  bool isExpanded(int index) {
    return expandedStates[index] ?? false;
  }
}
