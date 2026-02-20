import 'package:doctor_appointment_app/features/message/controller/chat_detail_controller.dart';
import 'package:doctor_appointment_app/features/message/model/message_model.dart';
import 'package:doctor_appointment_app/features/message/view/widgets/build_input_bar.dart';
import 'package:doctor_appointment_app/features/message/view/widgets/chat_app_bar_widget.dart';
import 'package:doctor_appointment_app/features/message/view/widgets/chat_bubble_tile.dart';
import 'package:doctor_appointment_app/features/message/view/widgets/date_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatDetailScreen extends StatelessWidget {
  final MessageModel doctor;

  const ChatDetailScreen({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    final ChatDetailController controller = Get.find<ChatDetailController>(tag: doctor.id);
    return Scaffold(
      appBar: ChatAppBarWidget(
        name: doctor.doctorName,
        imageUrl: doctor.avatarUrl,
        isOnline: doctor.isOnline,
        subtitle: doctor.specialty,
        onCallTap: () {
          // call action
        },
        onVideoCallTap: () {
          // video call action
        },
      ),
      body: Column(
        children: [
          Expanded(child: _buildMessageList(controller)),
          BuildInputBar(controller: controller),
        ],
      ),
    );
  }



  // ── Message List ......................
  Widget _buildMessageList(ChatDetailController ctrl) {
    return Obx(() => ListView.builder(
      controller: ctrl.scrollController,
      padding:
      const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: ctrl.messages.length,
      itemBuilder: (_, i) {
        final bubble = ctrl.messages[i];
        final showDate = i == 0 ||
            !_isSameDay(
                ctrl.messages[i - 1].time, bubble.time);
        return Column(
          children: [
            if (showDate) DateLabel(time: bubble.time),
            ChatBubbleTile(bubble: bubble, controller: ctrl),
          ],
        );
      },
    ));
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;
}

