import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';


class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Terms & Conditions",),
            SizedBox(height: getHeight(30)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Last Updated
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.lightGreenColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Last Updated: February 19, 2026',
                        style: globalTextStyle(
                          fontSize: 12,
                          color: AppColors.lightGreenColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Introduction
                    _buildSectionTitle('1. Introduction'),
                    _buildParagraph(
                      'Welcome to Medico ("we," "our," or "us"). These Terms and Conditions '
                          '("Terms") govern your access to and use of the Medico mobile application, '
                          'website, and related services (collectively, the "Services"). By accessing '
                          'or using our Services, you agree to be bound by these Terms. If you do not '
                          'agree to these Terms, please do not use our Services.',
                    ),

                    const SizedBox(height: 20),

                    // Acceptance of Terms
                    _buildSectionTitle('2. Acceptance of Terms'),
                    _buildParagraph(
                      'By creating an account or using our Services, you confirm that you are at '
                          'least 18 years old or have the consent of a parent or legal guardian. You '
                          'agree to provide accurate, current, and complete information during '
                          'registration and to update such information to keep it accurate, current, '
                          'and complete.',
                    ),

                    const SizedBox(height: 20),

                    // Medical Disclaimer
                    _buildSectionTitle('3. Medical Disclaimer'),
                    _buildParagraph(
                      'Medico is a platform that connects patients with licensed healthcare '
                          'providers. We do not provide medical advice, diagnosis, or treatment. '
                          'The information provided through our Services is for informational purposes '
                          'only and should not be considered a substitute for professional medical advice.',
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint(
                      'Always seek the advice of your physician or other qualified health provider '
                          'with any questions you may have regarding a medical condition.',
                    ),
                    _buildBulletPoint(
                      'Never disregard professional medical advice or delay seeking it because of '
                          'something you have read on Medico.',
                    ),
                    _buildBulletPoint(
                      'If you think you may have a medical emergency, call your doctor or emergency '
                          'services immediately.',
                    ),

                    const SizedBox(height: 20),

                    // User Responsibilities
                    _buildSectionTitle('4. User Responsibilities'),
                    _buildParagraph('You agree to:'),
                    const SizedBox(height: 8),
                    _buildBulletPoint('Provide accurate and truthful information'),
                    _buildBulletPoint('Maintain the confidentiality of your account credentials'),
                    _buildBulletPoint('Use the Services only for lawful purposes'),
                    _buildBulletPoint('Not share your account with others'),
                    _buildBulletPoint('Notify us immediately of any unauthorized use of your account'),
                    _buildBulletPoint('Respect the intellectual property rights of others'),
                    _buildBulletPoint('Not use the Services to transmit harmful or malicious content'),

                    const SizedBox(height: 20),

                    // Appointments and Consultations
                    _buildSectionTitle('5. Appointments and Consultations'),
                    _buildParagraph(
                      'When you book an appointment through Medico, you enter into a direct '
                          'relationship with the healthcare provider. Medico acts as an intermediary '
                          'platform only.',
                    ),
                    const SizedBox(height: 8),
                    _buildSubSectionTitle('5.1 Booking and Payment'),
                    _buildBulletPoint(
                      'All appointments must be paid for in advance through the platform',
                    ),
                    _buildBulletPoint(
                      'Prices are set by individual healthcare providers and may vary',
                    ),
                    _buildBulletPoint(
                      'Payment confirmation will be sent to your registered email',
                    ),
                    const SizedBox(height: 8),
                    _buildSubSectionTitle('5.2 Cancellation Policy'),
                    _buildBulletPoint(
                      'Cancellations made 24+ hours before appointment: 100% refund',
                    ),
                    _buildBulletPoint(
                      'Cancellations made 12-24 hours before: 50% refund',
                    ),
                    _buildBulletPoint(
                      'Cancellations made less than 12 hours before: No refund',
                    ),
                    _buildBulletPoint(
                      'Refunds will be processed within 5-7 business days',
                    ),

                    const SizedBox(height: 20),

                    // Privacy and Data Protection
                    _buildSectionTitle('6. Privacy and Data Protection'),
                    _buildParagraph(
                      'We take your privacy seriously. Your personal information and medical data '
                          'are handled in accordance with our Privacy Policy and applicable data '
                          'protection laws. By using our Services, you consent to the collection, use, '
                          'and sharing of your information as described in our Privacy Policy.',
                    ),

                    const SizedBox(height: 20),

                    // Intellectual Property
                    _buildSectionTitle('7. Intellectual Property'),
                    _buildParagraph(
                      'All content, features, and functionality of the Services, including but not '
                          'limited to text, graphics, logos, icons, images, audio clips, video clips, '
                          'data compilations, and software, are the exclusive property of Medico or '
                          'its licensors and are protected by international copyright, trademark, '
                          'patent, trade secret, and other intellectual property laws.',
                    ),

                    const SizedBox(height: 20),

                    // Limitation of Liability
                    _buildSectionTitle('8. Limitation of Liability'),
                    _buildParagraph(
                      'To the fullest extent permitted by law, Medico shall not be liable for any '
                          'indirect, incidental, special, consequential, or punitive damages, including '
                          'but not limited to loss of profits, data, use, goodwill, or other intangible '
                          'losses resulting from:',
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint('Your access to or use of (or inability to access or use) the Services'),
                    _buildBulletPoint('Any conduct or content of any third party on the Services'),
                    _buildBulletPoint('Any content obtained from the Services'),
                    _buildBulletPoint('Unauthorized access, use, or alteration of your transmissions or content'),

                    const SizedBox(height: 20),

                    // Termination
                    _buildSectionTitle('9. Termination'),
                    _buildParagraph(
                      'We may terminate or suspend your account and access to the Services '
                          'immediately, without prior notice or liability, for any reason, including '
                          'but not limited to breach of these Terms. Upon termination, your right to '
                          'use the Services will immediately cease.',
                    ),

                    const SizedBox(height: 20),

                    // Changes to Terms
                    _buildSectionTitle('10. Changes to Terms'),
                    _buildParagraph(
                      'We reserve the right to modify or replace these Terms at any time. If a '
                          'revision is material, we will provide at least 30 days\' notice prior to any '
                          'new terms taking effect. What constitutes a material change will be '
                          'determined at our sole discretion. By continuing to access or use our '
                          'Services after revisions become effective, you agree to be bound by the '
                          'revised terms.',
                    ),

                    const SizedBox(height: 20),

                    // Governing Law
                    _buildSectionTitle('11. Governing Law'),
                    _buildParagraph(
                      'These Terms shall be governed and construed in accordance with the laws of '
                          'Bangladesh, without regard to its conflict of law provisions. Any disputes '
                          'arising out of or relating to these Terms or the Services shall be resolved '
                          'in the courts of Dhaka, Bangladesh.',
                    ),

                    const SizedBox(height: 20),

                    // Contact Information
                    _buildSectionTitle('12. Contact Us'),
                    _buildParagraph(
                      'If you have any questions about these Terms and Conditions, please contact us:',
                    ),
                    const SizedBox(height: 12),
                    _buildContactInfo(Icons.email_outlined, 'support@medico.com'),
                    const SizedBox(height: 8),
                    _buildContactInfo(Icons.phone_outlined, '+880 1712-345678'),
                    const SizedBox(height: 8),
                    _buildContactInfo(
                      Icons.location_on_outlined,
                      'Dhaka, Bangladesh',
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ══════════════════════════════════════════════════════════════
  // HELPER WIDGETS
  // ══════════════════════════════════════════════════════════════

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: globalTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: const Color(0xFF1C1B2E),
      ),
    );
  }

  Widget _buildSubSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Text(
        title,
        style: globalTextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: const Color(0xFF1C1B2E),
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Text(
      text,
      style: globalTextStyle(
        fontSize: 14,
        color: const Color(0xFF6B7280),
      ),
      textAlign: TextAlign.justify,
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: globalTextStyle(
              fontSize: 14,
              color: AppColors.lightGreenColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: globalTextStyle(
                fontSize: 14,
                color: const Color(0xFF6B7280),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors.lightGreenColor),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: globalTextStyle(
              fontSize: 14,
              color: const Color(0xFF6B7280),
            ),
          ),
        ),
      ],
    );
  }
}