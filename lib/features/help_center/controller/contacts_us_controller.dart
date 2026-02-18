import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsUsController extends GetxController{

  // General launch url method...................
  Future<void> launchURLMethod(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        _showErrorSnackbar('Could not open the link');
      }
    } catch (e) {
      _showErrorSnackbar('Something went wrong: $e');
    }
  }


  // CUSTOMER SERVICE - PHONE CALL.............
  Future<void> callCustomerService(String phoneNumber) async {
    final Uri uri = Uri.parse('tel:$phoneNumber');
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        _showSuccessSnackbar('Opening dialer...');
      } else {
        _showErrorSnackbar('Could not open dialer');
      }
    } catch (e) {
      _showErrorSnackbar('Something went wrong: $e');
    }
  }


  // CUSTOMER SERVICE - EMAIL.....................
  Future<void> emailCustomerService({
    required String email,
    String? subject,
    String? body,
  }) async {
    String url = 'mailto:$email';

    // Add subject and body if provided
    List<String> params = [];
    if (subject != null) {
      params.add('subject=${Uri.encodeComponent(subject)}');
    }
    if (body != null) {
      params.add('body=${Uri.encodeComponent(body)}');
    }
    if (params.isNotEmpty) {
      url += '?${params.join('&')}';
    }

    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        _showSuccessSnackbar('Opening email app...');
      } else {
        _showErrorSnackbar('Could not open email app');
      }
    } catch (e) {
      _showErrorSnackbar('Something went wrong: $e');
    }
  }


  // WHATSAPP DIRECT MESSAGE.........................
  Future<void> openWhatsAppChat({
    required String phoneNumber,
    String message = '',
  }) async {
    // Remove any non-digit characters
    final cleanNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');
    final String url = 'https://wa.me/$cleanNumber?text=${Uri.encodeComponent(message)}';

    final Uri uri = Uri.parse(url);
    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        _showSuccessSnackbar('Opening WhatsApp...');
      } else {
        _showErrorSnackbar('Could not open WhatsApp');
      }
    } catch (e) {
      _showErrorSnackbar('Something went wrong: $e');
    }
  }


  // CUSTOMER SERVICE OPTIONS BOTTOM SHEET.......................
  void showCustomerServiceOptions({
    required String phoneNumber,
    required String email,
    required String whatsappNumber,
  }) {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Handle bar
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Contact Customer Service',
              style: globalTextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            // Call Option
            _buildBottomSheetTile(
              icon: Icons.phone_outlined,
              iconColor: AppColors.blueAccentColor,
              title: 'Call Us',
              subtitle: phoneNumber,
              onTap: () {
                Get.back();
                callCustomerService(phoneNumber);
              },
            ),

            const Divider(height: 1),

            // Email Option
            _buildBottomSheetTile(
              icon: Icons.email_outlined,
              iconColor: Colors.red,
              title: 'Email Us',
              subtitle: email,
              onTap: () {
                Get.back();
                emailCustomerService(
                  email: email,
                  subject: 'Customer Support Request',
                  body: 'Hello, I need help with...',
                );
              },
            ),

            const Divider(height: 1),

            // WhatsApp Option
            _buildBottomSheetTile(
              icon: Icons.chat_outlined,
              iconColor: const Color(0xFF25D366),
              title: 'WhatsApp',
              subtitle: whatsappNumber,
              onTap: () {
                Get.back();
                openWhatsAppChat(
                  phoneNumber: whatsappNumber,
                  message: 'Hello, I need help with Medico app',
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      isScrollControlled: true,
    );
  }

  Widget _buildBottomSheetTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 8),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 22),
      ),
      title: Text(
        title,
        style: globalTextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: globalTextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 15,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }


  // SNACKBAR HELPERS...............................
  void _showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.lightGreenColor,
      colorText: Colors.white,
      icon: const Icon(Icons.check_circle, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      icon: const Icon(Icons.error, color: Colors.white),
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 2),
    );
  }
}


