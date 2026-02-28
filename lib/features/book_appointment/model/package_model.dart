import 'package:flutter/material.dart';

class PackageModel {
  final String title;
  final String subtitle;
  final int price;
  final IconData icon;

  const PackageModel({
    required this.title,
    required this.subtitle,
    required this.price,
    required this.icon,
  });
}

final List<PackageModel> packagesData = const [
  PackageModel(
    title: 'Messaging',
    subtitle: 'Messages with doctor',
    price: 20,
    icon: Icons.chat_bubble_outline_rounded,
  ),
  PackageModel(
    title: 'Voice Call',
    subtitle: 'Voice call with doctor',
    price: 40,
    icon: Icons.phone_outlined,
  ),
  PackageModel(
    title: 'Video Call',
    subtitle: 'Video call with doctor',
    price: 60,
    icon: Icons.videocam_outlined,
  ),
];
