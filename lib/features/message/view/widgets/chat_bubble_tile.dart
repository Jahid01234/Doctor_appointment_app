import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/message/controller/chat_detail_controller.dart';
import 'package:doctor_appointment_app/features/message/model/chat_bubble_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatBubbleTile extends StatelessWidget {
  final ChatBubble bubble;
  final ChatDetailController controller;

  const ChatBubbleTile({
    super.key,
    required this.bubble,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final isMe = bubble.isSentByMe;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment:
        isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMe) ...[
            CircleAvatar(
              radius: 14,
              backgroundImage: NetworkImage(
                  controller.doctor.avatarUrl,
              ),
              backgroundColor: AppColors.greyColor
            ),
            const SizedBox(width: 8),
          ],
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Get.width * 0.68,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
              ),
              decoration: BoxDecoration(
                color: isMe
                    ? AppColors.lightGreenColor
                    : AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(18),
                  topRight: const Radius.circular(18),
                  bottomLeft: Radius.circular(isMe ? 18 : 4),
                  bottomRight: Radius.circular(isMe ? 4 : 18),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.06),
                    blurRadius: 6,
                    spreadRadius: 2,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: isMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    bubble.text,
                    style: globalTextStyle(
                      fontSize: 14,
                      color: isMe ? Colors.white : const Color(0xFF1A1A2E),
                      fontWeight: FontWeight.w400
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    controller.formatBubbleTime(bubble.time),
                    style: globalTextStyle(
                      fontSize: 11,
                      color: isMe
                          ? Colors.white.withValues(alpha: 0.7)
                          : Colors.grey.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (isMe) const SizedBox(width: 4),
        ],
      ),
    );
  }
}