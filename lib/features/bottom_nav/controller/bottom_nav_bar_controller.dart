import 'package:doctor_appointment_app/core/const/icons_path.dart';
import 'package:doctor_appointment_app/features/home/view/home_screen.dart';
import 'package:doctor_appointment_app/features/message/view/message_screen.dart';
import 'package:doctor_appointment_app/features/profile/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavBarController extends GetxController{
  var selectedIndex = 0.obs;
  final List<Map<String, String>> navItems = [
    {
      'active': IconsPath.homeAc,
      'inactive': IconsPath.home,
      'title': 'Home',
    },
    {
      'active': IconsPath.appointmentAc,
      'inactive': IconsPath.appointment,
      'title': 'Appointment',
    },
    {
      'active': IconsPath.locationAc,
      'inactive': IconsPath.location,
      'title': 'Location',
    },
    {
      'active': IconsPath.messageAc,
      'inactive': IconsPath.message,
      'title': 'Message',
    },
    {
      'active': IconsPath.profileAc,
      'inactive': IconsPath.profile,
      'title': 'Profile',
    },
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  final List<Widget> pages = [
    HomeScreen(),
    Center(child: Text("Appointment.....")),
    Center(child: Text("Location.....")),
    MessageScreen(),
    ProfileScreen()
  ];
}
