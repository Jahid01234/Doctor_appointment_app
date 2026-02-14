import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBackButton extends StatelessWidget {
  final String? title;

  const AppBackButton({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back),
        ),

        const Spacer(),
        if (title != null)
          Text(
            title!,
            style: globalTextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),

        const Spacer(),
        const SizedBox(width: 20),
      ],
    );
  }
}