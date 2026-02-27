import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/home/controller/home_controller.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/doctor_filterd_tab.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/top_doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopDoctorsScreen extends StatelessWidget {
  TopDoctorsScreen({super.key});
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: getHeight(60)),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Obx(() => Row(
                children: [
                  // Custom back button
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Row(
                      children: [
                        Icon(Icons.arrow_back),
                        const SizedBox(width: 20),
                        if (!controller.isSearching.value)
                          Text(
                            'Top Doctors',
                            style: globalTextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),
                  if (controller.isSearching.value)
                    Expanded(
                      child: CustomTextField(
                            controller: controller.searchTextController,
                            onChanged: controller.searchDoctors,
                            hinText: "Search by doctor name",
                      ),
                    )
                  else
                    const Spacer(),

                  const SizedBox(width: 8),

                  // Search toggle button
                  GestureDetector(
                    onTap: controller.toggleSearch,
                    child: Icon(
                      controller.isSearching.value
                          ? Icons.close
                          : Icons.search,
                      color: AppColors.blackColor,
                      size: 24,
                    ),
                  ),
                ],
              )),
            ),


          SizedBox(height: getHeight(30)),
          Obx(() => DoctorFilterTabs(
              tabs: controller.filterTabs,
              selectedTab: controller.selectedFilter.value,
              onTabSelected: controller.applyFilter,
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Obx(() {
              final doctors = controller.filteredDoctors;
              if (doctors.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.search_off, size: 40,
                          color: Colors.grey.shade400,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'No doctors found',
                        style: globalTextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return TopDoctorCard(
                      doctor: doctor,
                      onTap: () {
                        Get.toNamed(AppRoutes.doctorDetails,arguments: doctor);
                      },
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}