import 'package:doctor_appointment_app/features/help_center/controller/help_center_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpCenterScreen extends StatelessWidget {
  HelpCenterScreen({super.key});

  final HelpCenterController controller = Get.put(HelpCenterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}