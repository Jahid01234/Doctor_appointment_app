import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/home/model/slider_model.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  final SliderModel slider;

  const SliderCard ({
    super.key,
    required this.slider,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.lightGreenColor, AppColors.greenColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  slider.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: globalTextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  slider.subTitle,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: globalTextStyle(
                    color: Colors.white.withValues(alpha: 0.9),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                AppPrimaryButton(
                  height: 40,
                  width: 120,
                  text: "Check Now",
                  fontSize: 14,
                  textColor: AppColors.whiteColor,
                  onTap: () {},
                ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          //.........................
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              child: SizedBox(
                height: double.infinity,
                child: Image.asset(
                  slider.image,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                  color: AppColors.greenColor,
                  colorBlendMode: BlendMode.colorBurn,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


