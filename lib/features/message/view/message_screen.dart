import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/message/controller/message_controller.dart';
import 'package:doctor_appointment_app/features/message/view/widgets/chat_tile.dart';
import 'package:doctor_appointment_app/features/message/view/widgets/online_avatar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  final MessageController controller = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
             "Message",
              style: globalTextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: TextEditingController(),
              onChanged: controller.onSearch,
              hinText: "Search.....",
              textInputType: TextInputType.text,
              prefixIcon: const Icon(
                Icons.search_rounded,
                color: AppColors.greyColor,
              ),
            ),
            SizedBox(height: 20),
            _buildOnlineDoctors(),
            _buildSectionHeader(),
            Expanded(child: _buildChatList()),
          ],
        ),
      ),
    );
  }




  // ── Online Doctors Row ................
  Widget _buildOnlineDoctors() {
    return SizedBox(
      height: 90,
      child: Obx(() {
        final online =
        controller.filteredChats.where((c) => c.isOnline).toList();
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: online.length,
          itemBuilder: (_, i) => OnlineAvatar(chat: online[i]),
        );
      }),
    );
  }

  // ── Section Header .................
  Widget _buildSectionHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          'Recent',
          style: globalTextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
            color: AppColors.blackColor,
          ),
        ),
        TextButton(
          onPressed: () {},
          child: Text(
            'See all',
            style: globalTextStyle(
              fontSize: 13,
              color: AppColors.lightGreenColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  // ── Chat List ..............
  Widget _buildChatList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(
              color: Color(0xFF4A90D9),
              strokeWidth: 2,
          ),
        );
      }
      if (controller.filteredChats.isEmpty) {
        return Center(
          child: Text('No chats found',
              style: globalTextStyle(
                  color: Colors.grey,
                  fontSize: 15,
              ),
          ),
        );
      }
      return ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        itemCount: controller.filteredChats.length,
        separatorBuilder: (_, __) => Divider(
          color: Colors.grey.shade100,
          height: 1,
          indent: 80,
        ),
        itemBuilder: (context, index) {
          final chat = controller.filteredChats[index];
          return ChatTile(chat: chat, controller: controller);
        },
      );
    });
  }
}





