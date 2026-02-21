import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String name;
  final String imageUrl;
  final bool isOnline;
  final String subtitle;
  final VoidCallback? onVideoCallTap;
  final VoidCallback? onCallTap;

  const ChatAppBarWidget({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
    required this.subtitle,
    this.onVideoCallTap,
    this.onCallTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String _getInitials(String text) {
    return text
        .split(' ')
        .where((e) => e.isNotEmpty)
        .take(2)
        .map((e) => e[0])
        .join();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.white,
      elevation: 0.5,
      leading: IconButton(
        icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF1A1A2E),
            size: 20,
        ),
        onPressed: () => Get.back(),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage:
                imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                backgroundColor:
                const Color(0xFF4A90D9).withValues(alpha: 0.12),
                child: imageUrl.isEmpty
                    ? Text(
                  _getInitials(name),
                  style: globalTextStyle(
                    color: Color(0xFF4A90D9),
                    fontWeight: FontWeight.w600,
                  ),
                )
                    : null,
              ),
              if (isOnline)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2ECC71),
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.white,
                          width: 1.5,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: globalTextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
              Text(
                isOnline ? 'Online' : subtitle,
                style: globalTextStyle(
                  fontSize: 12,
                  color: isOnline
                      ? const Color(0xFF2ECC71)
                      : Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.call_outlined,
            color:  AppColors.lightGreenColor,
            size: 22,
          ),
          onPressed: onCallTap,
        ),
        IconButton(
          icon: const Icon(
              Icons.videocam_outlined,
              color: AppColors.lightGreenColor,
              size: 24,
          ),
          onPressed: onVideoCallTap,
        ),
      ],
    );
  }
}