import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/features/book_appointment/controller/my_appointment_controller.dart';
import 'package:doctor_appointment_app/features/book_appointment/view/widgets/appointment_tab_bar_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'widgets/appointment_card.dart';

class MyAppointmentScreen extends StatelessWidget {
  MyAppointmentScreen({super.key});

  final MyAppointmentController controller = Get.put(MyAppointmentController());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(
              title: "My Appointment",
              showBackButton: Get.key.currentState!.canPop(),
            ),
            SizedBox(height: getHeight(30)),
            AppointmentTabBarSection(controller: controller),
            const SizedBox(height: 10),

            // Appointment List.......
            Expanded(
              child: Obx(() {
                final list = controller.filteredAppointments;

                if (list.isEmpty) {
                  return const Center(child: Text("No Appointments"));
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return AppointmentCard(
                      appointment: list[index],
                      selectedTab: controller.selectedTabIndex.value,
                    );
                  },
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}