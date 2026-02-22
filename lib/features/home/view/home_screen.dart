import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/features/home/controller/home_controller.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/header_and_search_bar_section.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/slider_section_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
    HomeScreen({super.key});
  final HomeController controller  = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Column(
         children: [
           SizedBox(height: getHeight(60)),
           HeaderAndSearchBarSection(),
           SizedBox(height: getHeight(20)),
           SliderSectionWidget(controller: controller)
         ],
       ),
    );
  }
}
