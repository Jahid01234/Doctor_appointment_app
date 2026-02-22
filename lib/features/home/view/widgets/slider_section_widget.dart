import 'package:carousel_slider/carousel_slider.dart';
import 'package:doctor_appointment_app/features/home/controller/home_controller.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/slider_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SliderSectionWidget extends StatelessWidget {
  final HomeController controller;

   const SliderSectionWidget ({
     super.key,
     required this.controller,
   });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: controller.slidersList.length,
              options: CarouselOptions(
                height: 200,
                autoPlay: true,
                enlargeCenterPage: true,
                viewportFraction: 1,
                onPageChanged: (index, _) => controller.changeIndex(index),
              ),
              itemBuilder: (context, index, realIndex) {
                final slider = controller.slidersList[index];
                return SliderCard(slider: slider);
              },
            ),

            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Obx(
                    () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.slidersList.length,
                        (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: controller.currentIndex.value == index ? 20 : 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: controller.currentIndex.value == index
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

