import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';

class PaymentMethodCard extends StatelessWidget {
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const PaymentMethodCard({
    super.key,
    required this.image,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.lightGreenColor : Colors.transparent,
            width: isSelected ? 1 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 35,
              width: 35,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 16),

            // Payment method name
            Expanded(
              child: Text(
                _getPaymentName(image),
                style: globalTextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),

            // Radio button
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isSelected
                  ? const Icon(
                Icons.radio_button_checked,
                key: ValueKey('checked'),
                color: AppColors.lightGreenColor,
                size: 22,
              )
                  : const Icon(
                Icons.radio_button_unchecked,
                key: ValueKey('unchecked'),
                color: AppColors.lightGreenColor,
                size: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getPaymentName(String imagePath) {
    if (imagePath.toLowerCase().contains('stripe')) return 'Stripe';
    if (imagePath.toLowerCase().contains('paypal')) return 'PayPal';
    if (imagePath.toLowerCase().contains('google')) return 'Google Pay';
    if (imagePath.toLowerCase().contains('apple')) return 'Apple Pay';
    return 'Payment Method';
  }
}