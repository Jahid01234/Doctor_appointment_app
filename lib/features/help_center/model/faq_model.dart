import 'package:get/get.dart';

class FaqModel {
  final String question;
  final String answer;
  final String category;
  RxBool isExpanded;

  FaqModel({
    required this.question,
    required this.answer,
    required this.category,
    bool isExpanded = false,
  }) : isExpanded = isExpanded.obs;
}

final List<FaqModel> allFaqsModel = [
  // ── GENERAL ──
  FaqModel(
    question: 'What is Medico?',
    answer:
    'Medico is a comprehensive healthcare platform that connects patients with '
        'certified doctors for consultations, appointments, and medical services. '
        'You can book video calls, chat consultations, or in-person visits.',
    category: 'General',
  ),
  FaqModel(
    question: 'How to use Medico?',
    answer:
    'Download the app, create an account with your details, browse available doctors '
        'by specialty, select a time slot, and confirm your booking. You can also chat '
        'with doctors or book home visits.',
    category: 'General',
  ),
  FaqModel(
    question: 'How do I cancel an appointment?',
    answer:
    'Go to "My Appointments" from the bottom navigation, select the appointment '
        'you want to cancel, tap "Cancel Appointment", and confirm. Refund policies'
        ' vary based on cancellation time.',
    category: 'General',
  ),
  FaqModel(
    question: 'How do I save the recording?',
    answer:
    'After completing a video consultation, go to the session summary screen. Tap'
        ' the "Save Recording" button to store it in your appointment history for '
        'future reference.',
    category: 'General',
  ),
  FaqModel(
    question: 'How do I exit the app?',
    answer:
    'Simply press the back button on your Android device or swipe up from the bottom '
        'on iOS. You can also tap the home button to minimize the app.',
    category: 'General',
  ),

  // ── ACCOUNT ──
  FaqModel(
    question: 'How do I update my account info?',
    answer:
    'Go to Profile tab → Edit Profile. You can update your name, phone number, email,'
        ' address, and profile picture. Don\'t forget to save changes.',
    category: 'Account',
  ),
  FaqModel(
    question: 'How do I reset my password?',
    answer:
    'Go to Profile → Change Password. Enter your current password, then your new'
        ' password twice for confirmation. You can also reset via "Forgot Password"'
        ' on the login screen.',
    category: 'Account',
  ),
  FaqModel(
    question: 'Can I delete my account?',
    answer:
    'Yes. Go to Profile → Security → Delete Account. Note that this action is permanent '
        'and will delete all your data including appointment history.',
    category: 'Account',
  ),
  FaqModel(
    question: 'How do I verify my email?',
    answer:
    'After signing up, check your email inbox for a verification link. Click the '
        'link to verify. If you didn\'t receive it, check spam or request a new one'
        ' from Settings.',
    category: 'Account',
  ),

  // ── SERVICE ──
  FaqModel(
    question: 'What services are available?',
    answer:
    'Medico offers video consultations, chat consultations, in-person appointments,'
        ' home visits, lab test bookings, prescription management, and health article library.',
    category: 'Service',
  ),
  FaqModel(
    question: 'How do I book a service?',
    answer:
    'Search for a doctor by name or specialty, view their profile and availability, '
        'select a time slot that works for you, choose consultation type (video/chat/in-person),'
        ' and confirm booking.',
    category: 'Service',
  ),
  FaqModel(
    question: 'Can I reschedule an appointment?',
    answer:
    'Yes. Go to My Appointments, select the booking, tap "Reschedule", choose a '
        'new date and time, and confirm. Some doctors may have rescheduling restrictions.',
    category: 'Service',
  ),
  FaqModel(
    question: 'How long are video consultations?',
    answer:
    'Standard video consultations are 15-30 minutes depending on the doctor and '
        'consultation type. You\'ll see the duration when booking.',
    category: 'Service',
  ),
  FaqModel(
    question: 'Can I get a prescription after consultation?',
    answer:
    'Yes. After your consultation, the doctor can send a digital prescription directly '
        'to your account. You can view, download, or share it from My Prescriptions.',
    category: 'Service',
  ),

  // ── PAYMENT ──
  FaqModel(
    question: 'Why did my payment didn\'t work?',
    answer:
    'This could be due to insufficient funds, incorrect card details, or your bank'
        ' blocking online transactions. Check your card details and contact your bank'
        ' if the issue persists.',
    category: 'Payment',
  ),
  FaqModel(
    question: 'Why are my appointment prices different?',
    answer:
    'Prices vary based on doctor specialization, experience, consultation type '
        '(video/chat/in-person), and duration. Specialists typically charge more '
        'than general physicians.',
    category: 'Payment',
  ),
  FaqModel(
    question: 'Why I can\'t add a new payment method?',
    answer:
    'Ensure your card supports online transactions and international payments if'
        ' required. Check if your bank has enabled 3D Secure. Try again or contact support.',
    category: 'Payment',
  ),
  FaqModel(
    question: 'Why didn\'t I get the invoice of the payment?',
    answer:
    'Invoices are automatically sent to your registered email within 24 hours of '
        'successful payment. Check your spam folder. You can also download it from Payment History.',
    category: 'Payment',
  ),
  FaqModel(
    question: 'What payment methods do you accept?',
    answer:
    'We accept all major credit/debit cards (Visa, Mastercard, American Express), '
        'digital wallets (PayPal, Google Pay, Apple Pay), and bank transfers.',
    category: 'Payment',
  ),
  FaqModel(
    question: 'How do I get a refund?',
    answer:
    'Refunds are processed based on cancellation time. Cancel 24+ hours before: 100%'
        ' refund. 12-24 hours: 50% refund. Less than 12 hours: no refund. Refunds take '
        '5-7 business days.',
    category: 'Payment',
  ),
];