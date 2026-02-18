import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/features/help_center/controller/help_center_controller.dart';
import 'package:doctor_appointment_app/features/help_center/view/contact_us_tab_screen.dart';
import 'package:doctor_appointment_app/features/help_center/view/faq_tab_screen.dart';
import 'package:doctor_appointment_app/features/help_center/view/widgets/tab_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});

  final HelpCenterController controller = Get.put(HelpCenterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20),
        child: Column(
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Help Center",),
            SizedBox(height: getHeight(40)),
            TabBarSection(controller:controller),
            SizedBox(height: getHeight(20)),
            Obx(()=>Expanded(
              child: controller.selectedTabIndex.value == 0
                  ? FaqTabScreen()
                  : ContactUsTabScreen(),
             ),
            ),
          ],
        ),
      ),
    );
  }
}