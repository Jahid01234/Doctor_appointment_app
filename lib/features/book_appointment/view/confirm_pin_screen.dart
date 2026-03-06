import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/book_appointment/controller/confirm_pin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ConfirmPinScreen extends StatelessWidget {
  ConfirmPinScreen ({super.key});

  final ConfirmPinController controller = Get.put(ConfirmPinController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Enter Your Pin"),
            SizedBox(height: getHeight(200)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      "Enter your pin to confirm appointment",
                      textAlign: TextAlign.center,
                      style: globalTextStyle(
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: getHeight(60)),
                    Center(
                      child: Column(
                        children: [
                          Obx(() => Pinput(
                            length: 4,
                            controller: controller.otpController,
                            onChanged: (value) {
                              controller.validateOtp(value);
                            },
                            defaultPinTheme: PinTheme(
                              margin: EdgeInsets.only(right: 15),
                              width: 50,
                              height: 50,
                              textStyle: globalTextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black12,
                                border: Border.all(
                                  color: controller.otpError.value.isEmpty
                                      ? AppColors.lightGreenColor
                                      : Colors.red,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          )),
                          Obx(() => Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Text(
                              controller.otpError.value,
                              style: globalTextStyle(color: Colors.red, fontSize: 12),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(height: getHeight(300)),
                    Obx(()=>
                        AppPrimaryButton(
                          text: "Confirm",
                          textColor: AppColors.whiteColor,
                          isLoading: controller.isLoading.value,
                          onTap:(){
                            controller.confirmOtp();
                          },
                        ),
                    ),
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