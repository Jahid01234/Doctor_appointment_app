import 'package:doctor_appointment_app/features/help_center/controller/contacts_us_controller.dart';
import 'package:doctor_appointment_app/features/help_center/view/widgets/contact_us_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsTabScreen extends StatelessWidget {
     ContactUsTabScreen({super.key});

  final ContactsUsController controller = Get.put(ContactsUsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ContactUsTile(
                title: "Custom Services",
                icon: Icons.headset_mic_rounded,
                onTap: () {
                  controller.showCustomerServiceOptions(
                    phoneNumber: '+88017..........',
                    email: 'support@medico.com',
                    whatsappNumber: '88017.........',
                  );
                },
              ),
              ContactUsTile(
                title: "Websites",
                icon: Icons.language_outlined,
                onTap: () {
                  controller.launchURLMethod("https://dghs.gov.bd/");
                },
              ),
              ContactUsTile(
                title: "WhatsApp",
                icon: Icons.whatshot_sharp,
                onTap: () {
                  controller.launchURLMethod("https://www.whatsapp.com/");
                },
              ),
              ContactUsTile(
                title: "Facebook",
                icon: Icons.facebook,
                onTap: () {
                  controller.launchURLMethod("https://www.facebook.com/");
                },
              ),
              ContactUsTile(
                title: "Twitter",
                icon: Icons.alternate_email,
                onTap: () {
                  controller.launchURLMethod("https://x.com/");
                },
              ),
              ContactUsTile(
                title: "Instagram",
                icon: Icons.camera_alt_outlined,
                onTap: () {
                  controller.launchURLMethod("https://www.instagram.com/");
                },
              ),

              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
