import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/payment/controller/payment_controller.dart';
import 'package:doctor_appointment_app/features/payment/view/widgets/payment_method_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatelessWidget {
  PaymentScreen({super.key});

  final PaymentController controller = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Payments"),
            SizedBox(height: getHeight(40)),
            Text(
              "Select the payment method you want to use.",
              style: globalTextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
            SizedBox(height: getHeight(30)),
            Obx(() =>
                Column(
                children: List.generate(controller.paymentMethods.length, (index,) {
                  return PaymentMethodCard(
                    image: controller.paymentMethods[index],
                    isSelected: controller.selectedIndex.value == index,
                    onTap: () => controller.selectCard(index),
                  );
                }),
              ),
            ),
            SizedBox(height: getHeight(240)),
            Obx(() =>
                AppPrimaryButton(
                text: "Next",
                textColor: AppColors.whiteColor,
                isLoading: controller.isLoading.value,
                onTap: () {
                  controller.paymentMethod();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
