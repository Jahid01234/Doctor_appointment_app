import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/const/images_path.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_primary_button.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_field_title.dart';
import 'package:doctor_appointment_app/core/global_widgets/custom_text_field.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:doctor_appointment_app/features/profile/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen ({super.key});

  final EditProfileController controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Edit Profile",),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getHeight(30)),
                    // Profile Picture
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(()=>
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(200),
                                      border: Border.all(
                                        color: AppColors.lightGreenColor.withValues(
                                          alpha: 0.8,
                                        ),
                                        width: 1,
                                      ),
                                      image: DecorationImage(
                                        image:  controller.selectedImage.value != null
                                            ? FileImage(controller.selectedImage.value!)
                                            : const AssetImage(
                                            ImagesPath.profileImg
                                        ) as ImageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 85,
                                    right: 0,
                                    child: GestureDetector(
                                      onTap: () {
                                        controller.pickImage();
                                      },
                                      child: CircleAvatar(
                                        radius: 14,
                                        backgroundColor: AppColors.lightGreenColor,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Icon(
                                            Icons.camera_alt_outlined,
                                            size: 20,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                          ),
                          SizedBox(height: getHeight(10)),
                          Text(
                            "Md. Jahid Hasan",
                            style: globalTextStyle(
                                fontSize: 18,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          Text(
                            "jahid@gmail.com",
                            style: globalTextStyle(
                                fontSize: 15,
                                color: AppColors.greyColor,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: getHeight(60)),
                    CustomFieldTitle(title: "Name"),
                    SizedBox(height: 4),
                    CustomTextField(
                      controller: controller.nameController,
                      hinText: "Enter name",
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 20),
                    CustomFieldTitle(title: "Email"),
                    SizedBox(height: 4),
                    CustomTextField(
                      controller: controller.emailController,
                      hinText: "Enter email",
                      textInputType: TextInputType.text,
                    ),
                    const SizedBox(height: 20),
                    CustomFieldTitle(title: "Age"),
                    SizedBox(height: 4),
                    CustomTextField(
                      controller: controller.ageController,
                      hinText: "Enter age",
                      textInputType: TextInputType.number,
                    ),
                    const SizedBox(height: 20),
                    CustomFieldTitle(title: "Gender"),
                    SizedBox(height: 4),
                    CustomTextField(
                      controller: controller.genderController,
                      hinText: "Enter gender",
                      textInputType: TextInputType.text,
                    ),


                    SizedBox(height: getHeight(60)),
                    Obx(()=>
                        AppPrimaryButton(
                          text: "Update",
                          textColor: AppColors.whiteColor,
                          isLoading: controller.isLoading.value,
                          onTap:(){
                              controller.updateProfile();
                          },
                        ),
                    ),
                    SizedBox(height: getHeight(40)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}