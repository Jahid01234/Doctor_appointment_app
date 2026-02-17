import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  final String image;
  final bool isSelected;
  final VoidCallback? onTap;

  const PaymentMethodCard({
    super.key,
    required this.image,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: isSelected
              ? Colors.black26
              : Colors.black26,
          borderRadius: BorderRadius.circular(15),
          border: isSelected
              ? Border.all(color: AppColors.lightGreenColor, width: 1.5)
              : null,
        ),
        child: Image.asset(image, height: 20,color: Colors.white),
      ),
    );
  }
}