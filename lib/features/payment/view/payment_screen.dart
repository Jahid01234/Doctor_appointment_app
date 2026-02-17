import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
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
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Payment"),
            SizedBox(height: getHeight(50)),
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
                text: "Pay Now",
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
