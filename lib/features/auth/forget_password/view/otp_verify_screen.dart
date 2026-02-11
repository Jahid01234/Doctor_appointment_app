import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/header_section.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/auth/forget_password/controller/otp_verify_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyScreen extends StatelessWidget {
  OtpVerifyScreen ({super.key});

  final OtpVerifyController controller = Get.put(OtpVerifyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(60)),
              AppBackButton(),
              SizedBox(height: getHeight(80)),
              HeaderSection(title: "Verify Code"),
              SizedBox(height: getHeight(10)),
              Text(
                "Enter the the code we just sent you on your registered Email",
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
              SizedBox(height: getHeight(20)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive the code? Try again in: ",
                    style: globalTextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Obx(() {
                    return Text(
                      " ${controller.formattedTime}",
                      style: globalTextStyle(
                        color: Colors.black54,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    );
                  }),
                ],
              ),
              SizedBox(height: getHeight(60)),
              Obx(()=>
                  AppPrimaryButton(
                    text: "Verify",
                    textColor: AppColors.whiteColor,
                    isLoading: controller.isLoading.value,
                    onTap:(){
                      controller.verifyOtp();
                    },
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}