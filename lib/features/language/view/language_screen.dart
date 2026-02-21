import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/features/language/controller/language_controller.dart';
import 'package:doctor_appointment_app/features/language/view/widgets/language_tile.dart';
import 'package:doctor_appointment_app/features/language/view/widgets/section_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageScreen extends StatelessWidget {
   LanguageScreen({super.key});

  final LanguageController controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Language"),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Suggested Section ──────────────────────────────────────────
                    SectionHeader(title: 'Suggested'),
                    ...controller.suggestedLanguages.map(
                          (lang) => LanguageTile(lang: lang, controller: controller),
                    ),

                    const SizedBox(height: 8),
                    const Divider(height: 1, thickness: 1, color: Color(0xFFF0F0F0)),
                    const SizedBox(height: 8),

                    // ── All Languages Section ──────────────────────────────────────
                    SectionHeader(title: 'Language'),
                    ...controller.allLanguages.map(
                          (lang) => LanguageTile(lang: lang, controller: controller),
                    ),
                    const SizedBox(height: 24),
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
