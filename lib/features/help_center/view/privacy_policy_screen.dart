import 'package:doctor_appointment_app/core/const/app_colors.dart';
import 'package:doctor_appointment_app/core/const/app_size.dart';
import 'package:doctor_appointment_app/core/global_widgets/app_back_button.dart';
import 'package:doctor_appointment_app/core/style/global_text_style.dart';
import 'package:flutter/material.dart';


class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: getHeight(60)),
            AppBackButton(title: "Privacy Policy",),
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
                        'Effective Date: February 19, 2026',
                        style: globalTextStyle(
                          fontSize: 12,
                          color: AppColors.lightGreenColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Introduction
                    _buildSectionTitle('Introduction'),
                    _buildParagraph(
                      'At Medico, we are committed to protecting your privacy and ensuring the '
                          'security of your personal information. This Privacy Policy explains how we '
                          'collect, use, disclose, and safeguard your information when you use our '
                          'mobile application and services.',
                    ),

                    const SizedBox(height: 20),

                    // Information We Collect
                    _buildSectionTitle('1. Information We Collect'),

                    const SizedBox(height: 12),
                    _buildSubSectionTitle('1.1 Personal Information'),
                    _buildBulletPoint('Full name and date of birth'),
                    _buildBulletPoint('Email address and phone number'),
                    _buildBulletPoint('Residential address'),
                    _buildBulletPoint('Profile picture'),
                    _buildBulletPoint('Payment information (securely processed by third-party providers)'),

                    const SizedBox(height: 12),
                    _buildSubSectionTitle('1.2 Medical Information'),
                    _buildBulletPoint('Medical history and conditions'),
                    _buildBulletPoint('Prescriptions and medications'),
                    _buildBulletPoint('Consultation records and notes'),
                    _buildBulletPoint('Lab results and reports'),
                    _buildBulletPoint('Allergies and health preferences'),

                    const SizedBox(height: 12),
                    _buildSubSectionTitle('1.3 Usage Data'),
                    _buildBulletPoint('Device information (model, OS version)'),
                    _buildBulletPoint('IP address and location data'),
                    _buildBulletPoint('App usage patterns and preferences'),
                    _buildBulletPoint('Search queries and interactions'),

                    const SizedBox(height: 20),

                    // How We Use Your Information
                    _buildSectionTitle('2. How We Use Your Information'),
                    _buildParagraph('We use your information to:'),
                    const SizedBox(height: 8),
                    _buildBulletPoint('Facilitate appointments with healthcare providers'),
                    _buildBulletPoint('Provide personalized medical services'),
                    _buildBulletPoint('Process payments and maintain records'),
                    _buildBulletPoint('Send appointment reminders and notifications'),
                    _buildBulletPoint('Improve our services and user experience'),
                    _buildBulletPoint('Comply with legal obligations'),
                    _buildBulletPoint('Prevent fraud and ensure platform security'),

                    const SizedBox(height: 20),

                    // Information Sharing
                    _buildSectionTitle('3. Information Sharing and Disclosure'),

                    const SizedBox(height: 12),
                    _buildSubSectionTitle('We may share your information with:'),
                    const SizedBox(height: 8),
                    _buildBulletPoint(
                      'Healthcare Providers: When you book appointments, your relevant medical '
                          'information is shared with your chosen provider',
                    ),
                    _buildBulletPoint(
                      'Service Providers: Third-party companies that help us operate our platform '
                          '(payment processors, cloud storage, analytics)',
                    ),
                    _buildBulletPoint(
                      'Legal Authorities: When required by law or to protect rights and safety',
                    ),
                    _buildBulletPoint(
                      'Business Transfers: In case of merger, acquisition, or sale of assets',
                    ),

                    const SizedBox(height: 12),
                    _buildHighlightBox(
                      'We never sell your personal or medical information to third parties.',
                    ),

                    const SizedBox(height: 20),

                    // Data Security
                    _buildSectionTitle('4. Data Security'),
                    _buildParagraph(
                      'We implement industry-standard security measures to protect your information:',
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint('End-to-end encryption for sensitive data'),
                    _buildBulletPoint('Secure HTTPS connections'),
                    _buildBulletPoint('Regular security audits and updates'),
                    _buildBulletPoint('Access controls and authentication'),
                    _buildBulletPoint('Secure data storage with encrypted backups'),

                    const SizedBox(height: 20),

                    // Your Rights
                    _buildSectionTitle('5. Your Rights and Choices'),
                    _buildParagraph('You have the right to:'),
                    const SizedBox(height: 8),
                    _buildBulletPoint('Access your personal and medical data'),
                    _buildBulletPoint('Correct inaccurate information'),
                    _buildBulletPoint('Request deletion of your data'),
                    _buildBulletPoint('Opt-out of marketing communications'),
                    _buildBulletPoint('Export your data in a portable format'),
                    _buildBulletPoint('Object to certain data processing'),

                    const SizedBox(height: 20),

                    // Data Retention
                    _buildSectionTitle('6. Data Retention'),
                    _buildParagraph(
                      'We retain your information for as long as your account is active or as '
                          'needed to provide services. Medical records are retained in compliance '
                          'with healthcare regulations (typically 7-10 years). You may request '
                          'deletion of your account at any time, subject to legal retention requirements.',
                    ),

                    const SizedBox(height: 20),

                    // Children's Privacy
                    _buildSectionTitle('7. Children\'s Privacy'),
                    _buildParagraph(
                      'Our services are not intended for children under 18 without parental '
                          'consent. If we discover we have collected information from a child without '
                          'proper consent, we will delete it immediately.',
                    ),

                    const SizedBox(height: 20),

                    // International Transfers
                    _buildSectionTitle('8. International Data Transfers'),
                    _buildParagraph(
                      'Your information may be transferred to and processed in countries other '
                          'than your own. We ensure appropriate safeguards are in place to protect '
                          'your data in accordance with this Privacy Policy.',
                    ),

                    const SizedBox(height: 20),

                    // Changes to Policy
                    _buildSectionTitle('9. Changes to This Policy'),
                    _buildParagraph(
                      'We may update this Privacy Policy from time to time. We will notify you '
                          'of any changes by posting the new policy on this page and updating the '
                          '"Effective Date." Continued use of our services after changes constitutes '
                          'acceptance of the updated policy.',
                    ),

                    const SizedBox(height: 20),

                    // Contact
                    _buildSectionTitle('10. Contact Us'),
                    _buildParagraph(
                      'If you have questions about this Privacy Policy or wish to exercise your rights:',
                    ),
                    const SizedBox(height: 12),
                    _buildContactInfo(Icons.email_outlined, 'privacy@medico.com'),
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

  Widget _buildHighlightBox(String text) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.lightGreenColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.lightGreenColor.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.info_outline,
            color: AppColors.lightGreenColor,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: globalTextStyle(
                fontSize: 13,
                color: AppColors.lightGreenColor,
                fontWeight: FontWeight.w600,
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