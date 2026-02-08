import 'package:doctor_appointment_app/core/const/images_path.dart';


class OnboardingModel{
  final String title;
  final String subTitle;
  final String image;

  OnboardingModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });

}

List<OnboardingModel> onboardingItemsListData = [
  OnboardingModel(
    title: "Find Trusted Doctors",
    subTitle: "Easily search and discover verified doctors from different specialties"
        " near you, view their profiles, experience, ratings, and choose the right doctor"
        " that best fits your healthcare needs with confidence.",
    image: ImagesPath.onboarding1,
  ),
  OnboardingModel(
    title: "Book Appointments Easily",
    subTitle: "Schedule your doctor visit in just a few taps, choose your preferred"
        " time and date, and avoid long waiting lines with a fast, simple, and hassle-free "
        "booking experience.",
    image: ImagesPath.onboarding2,
  ),
  OnboardingModel(
    title: "Smart & Secure Healthcare",
    subTitle: "Manage your appointments, make secure payments, access your medical "
        "history, prescriptions, and reports anytime, and keep all your healthcare"
        " information organized safely in one convenient place.",
    image: ImagesPath.onboarding3,
  ),
];