import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/features/home/controller/home_controller.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/doctor_specialist_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SeeAllDoctorSpecialistScreen extends StatelessWidget {
  SeeAllDoctorSpecialistScreen({super.key});

  final HomeController controller  = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: getHeight(60)),
              AppBackButton(title: "Doctor Specialist"),
              SizedBox(height: getHeight(10)),
              Expanded(
                child: Obx(() => GridView.builder(
                    itemCount: controller.specialistList.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 30,
                      childAspectRatio: 0.9,
                    ),
                    itemBuilder: (context, index) {
                      final specialist = controller.specialistList[index];
                      return DoctorSpecialistCard(
                        doctorSpecialistModel: specialist,
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
