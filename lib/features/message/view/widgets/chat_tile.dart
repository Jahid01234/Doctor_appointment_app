import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/message/controller/chat_detail_controller.dart';
import 'package:doctor_appointment_app/features/message/controller/message_controller.dart';
import 'package:doctor_appointment_app/features/message/model/message_model.dart';
import 'package:doctor_appointment_app/features/message/view/chat_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTile extends StatelessWidget {
  final MessageModel chat;
  final MessageController controller;

  const ChatTile({
    super.key,
    required this.chat,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildAvatar(),
            const SizedBox(width: 14),
            Expanded(child: _buildContent()),
            const SizedBox(width: 14),
            _buildTimestamp(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return Stack(
      children: [
        Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
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
        if (chat.isOnline)
          Positioned(
            right: 2,
            bottom: 2,
            child: Container(
              width: 13,
              height: 13,
              decoration: BoxDecoration(
                color: const Color(0xFF2ECC71),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          chat.doctorName,
          style:globalTextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 4),
        Text(
          chat.lastMessage,
          style: globalTextStyle(
            fontSize: 13,
            color: chat.unreadCount > 0
                ? const Color(0xFF1A1A2E)
                : Colors.grey.shade500,
            fontWeight: chat.unreadCount > 0
                ? FontWeight.w600
                : FontWeight.w400,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }

  Widget _buildTimestamp() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          controller.formatTimestamp(chat.timestamp),
          textAlign: TextAlign.right,
          style: globalTextStyle(
            fontSize: 11,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w400
          ),
        ),
        const SizedBox(height: 6),
        if (chat.unreadCount > 0)
          Container(
            width: 22,
            height: 22,
            decoration: const BoxDecoration(
              color: Color(0xFF4A90D9),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                chat.unreadCount.toString(),
                style: globalTextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        else
          const SizedBox(height: 22),
      ],
    );
  }
}