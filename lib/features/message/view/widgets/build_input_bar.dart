import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/message/controller/chat_detail_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildInputBar extends StatelessWidget {
  final ChatDetailController controller;

  const BuildInputBar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(
              Icons.attach_file_outlined,
              color: AppColors.lightGreenColor,
              size: 22,
            ),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF4F6FA),
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                controller: controller.textController,
                maxLines: 4,
                minLines: 1,
                textCapitalization: TextCapitalization.sentences,
                style: globalTextStyle(fontSize: 15, color: Color(0xFF1A1A2E)),
                decoration: InputDecoration(
                  hintText: 'Type a message...',
                  hintStyle: globalTextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 15,
                  ),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                ),
                onSubmitted: (_) => controller.sendMessage(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Obx(
            () => GestureDetector(
              onTap: controller.isSending.value ? null : controller.sendMessage,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: controller.isSending.value
                      ? Colors.grey.shade300
                      : AppColors.lightGreenColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4A90D9).withValues(alpha: 0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: controller.isSending.value
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
