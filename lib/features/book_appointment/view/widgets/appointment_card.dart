import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/book_appointment/model/appointment_model..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppointmentCard extends StatelessWidget {
  final AppointmentModel appointment;
  final int selectedTab;

  const AppointmentCard({
    super.key,
    required this.appointment,
    required this.selectedTab,
  });


  Color _getStatusColor(String status) {
    switch (status) {
      case "Cancelled":
        return Colors.red;
      case "Upcoming":
        return Colors.teal;
      case "Completed":
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }

  IconData _getTypeIcon(String type) {
    switch (type) {
      case "Messaging":
        return Icons.message_outlined;
      case "Audio Call":
        return Icons.call;
      case "Video Call":
        return Icons.videocam;
      default:
        return Icons.medical_services;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  appointment.doctorImage,
                  width: 70,
                  height: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 70,
                    height: 70,
                    color: Colors.grey.shade200,
                    child: const Icon(
                        Icons.person,
                        size: 35,
                        color: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      appointment.doctorName,
                      style: globalTextStyle(
                        fontSize: 15,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                     // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "${appointment.type} ",
                          style: globalTextStyle(
                            fontSize: 12,
                            color: AppColors.greyColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: _getStatusColor(appointment.status),
                            ),
                          ),
                          child: Text(
                            appointment.status,
                            style: globalTextStyle(
                              fontSize: 12,
                              color: _getStatusColor(appointment.status),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.message);
                          },
                          child: Container(
                            padding: const EdgeInsets.all(9),
                            decoration: BoxDecoration(
                              color: AppColors.lightGreenColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Icon(
                              _getTypeIcon(appointment.type),
                              size: 20,
                              color: AppColors.lightGreenColor,
                            ),
                          ),
                        ),

                      ],
                    ),

                    const SizedBox(height: 4),
                    Text(
                      "${appointment.date} | ${appointment.time}",
                      style: globalTextStyle(
                        fontSize: 12,
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          /// Buttons Based On Tab
          if (selectedTab == 0) // Upcoming
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppPrimaryButton(
                  height: 36,
                  width: 150,
                  text: "Cancel Appointment",
                  fontSize: 12,
                  textColor: AppColors.whiteColor,
                  onTap: () {},
                ),

                AppPrimaryButton(
                  height: 36,
                  width: 150,
                  text: "Reschedule",
                  fontSize: 12,
                  textColor: AppColors.whiteColor,
                  onTap: () {},
                ),
              ],
            ),

          if (selectedTab == 1) // Completed
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppPrimaryButton(
                  height: 36,
                  width: 150,
                  text: "Book Again",
                  fontSize: 12,
                  textColor: AppColors.whiteColor,
                  onTap: () {},
                ),

                AppPrimaryButton(
                  height: 36,
                  width: 150,
                  text: "Leave a Review",
                  fontSize: 12,
                  textColor: AppColors.whiteColor,
                  onTap: () {},
                ),
              ],
            ),

        ],
      ),
    );
  }
}