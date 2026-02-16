import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/notification/controller/notification_controller.dart';
import 'package:doctor_appointment_app/features/notification/model/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
  final int index;
  final NotificationController controller;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.index,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final isExpanded = controller.isExpanded(index);
      return AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.greyColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Title Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: AppColors.greyColor.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(50)
                  ),
                    child: Icon(
                        Icons.calendar_month_rounded,
                        size: 20,
                        color: Colors.white,
                    ),
                ),
                SizedBox(width: getWidth(10)),
                Expanded(
                  child: Text(
                    notification.title,
                    style: globalTextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                SizedBox(width: getWidth(10)),
                if (!isExpanded)
                  Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.lightGreenColor,
                    ),
                  ),


              ],
            ),
            SizedBox(height: getHeight(3)),

            // Subtitle (Expandable)...........
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                firstChild: Text(
                  notification.subTitle,
                  style: globalTextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                secondChild: Text(
                  notification.subTitle,
                  style: globalTextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                crossFadeState: isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
              ),
            ),
            SizedBox(height: getHeight(8)),

            // Footer Row..........
            Padding(
              padding: const EdgeInsets.only(left: 45),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _getTimeAgo(notification.dateTime),
                    style: globalTextStyle(
                      color: Colors.blueGrey.shade600,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => controller.toggleExpand(index),
                    child: Text(
                      isExpanded ? "See less" : "See more",
                      style: globalTextStyle(
                        color: isExpanded ?  Colors.grey : AppColors.lightGreenColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  String _getTimeAgo(DateTime dateTime) {
    final difference = DateTime.now().difference(dateTime);
    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }
}