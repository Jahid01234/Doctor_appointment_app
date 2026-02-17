import 'package:flutter/material.dart';

class ContactModel {
  final String title;
  final IconData icon;
  final Color iconColor;
  final VoidCallback? onTap;

  ContactModel({
    required this.title,
    required this.icon,
    required this.iconColor,
    this.onTap,
  });
}