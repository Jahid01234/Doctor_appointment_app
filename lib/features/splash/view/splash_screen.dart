import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/images_path.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
      SplashScreen({super.key});

  final SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Spacer(),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    ImagesPath.appImg,
                    height: 40,
                    width: 50,
                    fit: BoxFit.fill,
                ),
                SizedBox(width: 10),
                RichText(
                  text: TextSpan(
                    text: "Health",
                    style: globalTextStyle(
                      fontSize: 24,
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w700
                    ),
                    children: [
                      TextSpan(
                      text: "Care",
                      style: globalTextStyle(
                          fontSize: 27,
                          color: AppColors.lightGreenColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ]
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: SpinKitCircle(
              size: 70,
              color: AppColors.lightGreenColor,
            ),
          ),
        ],
      ),
    );
  }
}
