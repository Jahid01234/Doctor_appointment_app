import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/message/controller/chat_detail_controller.dart';
import 'package:doctor_appointment_app/features/message/model/message_model.dart';
import 'package:doctor_appointment_app/features/message/view/chat_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnlineAvatar extends StatelessWidget {
  final MessageModel chat;

  const OnlineAvatar({
    super.key,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    final firstName = chat.doctorName.split(' ').length > 1
        ? chat.doctorName.split(' ')[1]
        : chat.doctorName;

    return GestureDetector(
      onTap: (){
        Get.to(
              () => ChatDetailScreen(doctor: chat),
          binding: BindingsBuilder(() {
            Get.put(ChatDetailController(doctor: chat),
                tag: chat.id);
          }),
          transition: Transition.cupertino,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: AppColors.blueAccentColor,
                        width: 2.5,
                    ),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      chat.avatarUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) =>
                          Icon(Icons.person_outline,size: 20),
                    ),
                  ),
                ),
                Positioned(
                  right: 2,
                  bottom: 2,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2ECC71),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              firstName,
              style: globalTextStyle(
                fontSize: 11,
                color: AppColors.greyColor,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
