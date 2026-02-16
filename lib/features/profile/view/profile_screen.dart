import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/routes/app_routes.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/profile/controller/profile_controller.dart';
import 'package:doctor_appointment_app/features/profile/view/widgets/profile_component_tile.dart';
import 'package:doctor_appointment_app/features/profile/view/widgets/profile_header_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getHeight(60)),
              ProfileHeaderSection(),
              SizedBox(height: getHeight(30)),
              Divider(color: AppColors.greyColor.withValues(alpha: 0.3)),
              SizedBox(height: getHeight(20)),
              ProfileComponentTile(
                icon: Icons.person_outline,
                title: "Edit Profile",
                onTap: () {
                  Get.toNamed(AppRoutes.editProfile);
                },
              ),
              ProfileComponentTile(
                icon: Icons.lock_outline,
                title: "Change Password",
                onTap: () {
                  Get.toNamed(AppRoutes.changePassword);
                },
              ),
              ProfileComponentTile(
                icon: Icons.notifications_none_sharp,
                title: "Notification",
                onTap: () {
                  Get.toNamed(AppRoutes.notification);
                },
              ),
              ProfileComponentTile(
                icon: Icons.payment_outlined,
                title: "Payment",
                onTap: () {},
              ),
              ProfileComponentTile(
                icon: Icons.security,
                title: "Security",
                onTap: () {
                  Get.toNamed(AppRoutes.security);
                },
              ),
              ProfileComponentTile(
                icon: Icons.language,
                title: "Language",
                trailingText: "English (US)",
                onTap: () {},
              ),
              Obx(
                () => ProfileComponentTile(
                  icon: Icons.dark_mode_outlined,
                  title: "Dark Mode",
                  showSwitch: true,
                  switchValue: controller.isDarkMode.value,
                  onSwitchChanged: controller.toggleSwitch,
                ),
              ),
              ProfileComponentTile(
                icon: Icons.help_outline,
                title: "Help Center",
                onTap: () {},
              ),
              ProfileComponentTile(
                icon: Icons.description_outlined,
                title: "Terms and Conditions",
                onTap: () {},
              ),
              ProfileComponentTile(
                icon: Icons.logout,
                iconColor: Colors.red,
                title: "Logout",
                titleColor: Colors.red,
                onTap: () {
                  logoutBottomSheet(context);
                },
              ),
              SizedBox(height: getHeight(30)),
            ],
          ),
        ),
      ),
    );
  }

  // logout bottom sheet.........
  void logoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: getHeight(20)),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.red.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.logout, color: Colors.red, size: 20),
              ),
              SizedBox(height: getHeight(10)),
              Text(
                "Logout",
                style: globalTextStyle(
                  fontSize: 20,
                  color: AppColors.blackColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: getHeight(10)),
              Text(
                "Are you sure you want to logout?",
                textAlign: TextAlign.center,
                style: globalTextStyle(
                  fontSize: 16,
                  color: AppColors.greyColor,
                ),
              ),
              SizedBox(height: getHeight(30)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppPrimaryButton(
                    height: 50,
                    width: 130,
                    text: "Cancel",
                    bgColor: AppColors.greyColor,
                    textColor: AppColors.whiteColor,
                    onTap: () {
                      Get.back();
                    },
                  ),
                  AppPrimaryButton(
                    height: 50,
                    width: 130,
                    text: "Logout",
                    textColor: AppColors.whiteColor,
                    onTap: () {
                      Get.back();
                      controller.logoutTap();
                    },
                  ),
                ],
              ),
              SizedBox(height: getHeight(20)),
            ],
          ),
        );
      },
    );
  }
}
