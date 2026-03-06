import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/section_header.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/book_appointment/controller/reschedule_date_time_picker_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

class RescheduleDateTimePickerScreen extends StatelessWidget {
  RescheduleDateTimePickerScreen({super.key});

  final RescheduleDateTimePickerController controller = Get.put(
    RescheduleDateTimePickerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Date And Time Picker"),
            SizedBox(height: getHeight(20)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SectionHeader(title: 'Select Date'),
                    SizedBox(height: getHeight(12)),
                    Obx(
                      () => Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: AppColors.blackColor.withValues(alpha: 0.02),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TableCalendar(
                          firstDay: DateTime.utc(2020, 1, 1),
                          lastDay: DateTime.utc(2030, 12, 31),
                          focusedDay: controller.selectedDate.value,
                          selectedDayPredicate: (day) => isSameDay(controller.selectedDate.value, day),
                          onDaySelected: (selectedDay, focusedDay) {
                            controller.selectDate(selectedDay);
                          },
                          daysOfWeekStyle: DaysOfWeekStyle(
                            weekdayStyle: globalTextStyle(
                              fontSize: 14,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          headerStyle: HeaderStyle(
                            formatButtonVisible: false,
                            titleCentered: true,
                            titleTextStyle: globalTextStyle(
                              fontSize: 15,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          calendarStyle: CalendarStyle(
                            defaultTextStyle: globalTextStyle(
                              fontSize: 14,
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w400,
                            ),
                            selectedDecoration: const BoxDecoration(
                              color: AppColors.lightGreenColor,
                              shape: BoxShape.circle,
                            ),
                            todayDecoration: BoxDecoration(
                              color: AppColors.greyColor.withValues(alpha: 0.5),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: getHeight(30)),
                    const SectionHeader(title: 'Select Hour'),
                    SizedBox(height: getHeight(12)),
                    GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.timeSlots.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2.5,
                      ),
                      itemBuilder: (context, index) {
                        final time = controller.timeSlots[index];
                        return Obx(() {
                          final isSelected = controller.selectedTime.value == time;
                          return GestureDetector(
                            onTap: () => controller.selectTime(time),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.lightGreenColor
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(24),
                                border: Border.all(
                                  color: AppColors.lightGreenColor,
                                ),
                              ),
                              child: Text(
                                time,
                                style: globalTextStyle(
                                  fontSize: 14,
                                  color: isSelected ? Colors.white : AppColors.blackColor,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          );
                        });
                      },
                    ),
                    SizedBox(height: getHeight(60)),
                    Obx(
                      () => AppPrimaryButton(
                        text: "Next",
                        textColor: AppColors.whiteColor,
                        isLoading: controller.isLoading.value,
                        onTap: () {
                          controller.setDateTimeMethod();
                        },
                      ),
                    ),
                    SizedBox(height: getHeight(40)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
