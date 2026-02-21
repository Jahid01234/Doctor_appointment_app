import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/message/model/message_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AudioCallScreen extends StatelessWidget {
  AudioCallScreen({super.key});

  final MessageModel doctor = Get.arguments as MessageModel;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            // Doctor image...........
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage(doctor.avatarUrl),
            ),
            const SizedBox(height: 20),

            // Doctor Name...........
            Text(
              doctor.doctorName,
              style: globalTextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 8),
            Text(
              "Calling...",
              style: globalTextStyle(
                  color: Colors.white70,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
              ),
            ),

            const Spacer(),

            // Call Controls..........
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _circleButton(Icons.mic_off, Colors.orange),
                _circleButton(Icons.volume_up, Colors.blue),
                _circleButton(Icons.call_end, Colors.red, onTap: () => Get.back()),
              ],
            ),

            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _circleButton(IconData icon, Color color, {VoidCallback? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: 28,
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}