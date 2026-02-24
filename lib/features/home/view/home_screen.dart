import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/header_see_all_section.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:doctor_appointment_app/features/home/controller/home_controller.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/doctor_specialist_card.dart';
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
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           SizedBox(height: getHeight(60)),
           HeaderAndSearchBarSection(),
           SizedBox(height: getHeight(20)),
           SliderSectionWidget(controller: controller),
           SizedBox(height: getHeight(30)),
           HeaderSeeAllSection(
             title: "Doctor Specialist",
             onTap: (){
               Get.toNamed(AppRoutes.seeAllDoctorSpecialist);
             },
           ),
           SizedBox(height: getHeight(15)),
           Padding(
             padding: const EdgeInsets.only(left: 20),
             child: SizedBox(
               height: 100,
               child: Obx(() => ListView.separated(
                   scrollDirection: Axis.horizontal,
                   itemCount: controller.specialistList.length,
                   separatorBuilder: (_,__){
                     return SizedBox(width: 10);
                   },
                   itemBuilder: (context, index) {
                     final specialist = controller.specialistList[index];
                     return DoctorSpecialistCard(
                       doctorSpecialistModel: specialist,
                     );
                   },
                 ),
               ),
             ),
           ),
         ],
       ),
    );
  }
}
