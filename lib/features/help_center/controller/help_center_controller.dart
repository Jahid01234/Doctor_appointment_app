import 'package:get/get.dart';

class HelpCenterController extends GetxController {
  final RxInt selectedTabIndex = 0.obs;

  void selectTab(int index) {
    selectedTabIndex.value = index;
  }

}
