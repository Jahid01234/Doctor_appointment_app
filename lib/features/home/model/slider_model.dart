import 'package:doctor_appointment_app/core/const/images_path.dart';

class SliderModel {
  final String title;
  final String subTitle;
  final String image;

  SliderModel({
    required this.title,
    required this.subTitle,
    required this.image,
  });
}


final List<SliderModel> sliders = [
  SliderModel(
    title: "Medical Checks!",
    subTitle: "Check your health condition regularly to minimize the incidence of disease in the future.",
    image: ImagesPath.doctor1,
  ),
  SliderModel(
    title: "Easy Appointment!",
    subTitle: "Book your doctor appointment easily and quickly anytime.",
    image: ImagesPath.doctor2,
  ),
  SliderModel(
    title: "Best Doctors!",
    subTitle: "Find the best doctors and specialists near you.",
    image: ImagesPath.doctor3,
  ),
];