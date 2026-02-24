import 'package:doctor_appointment_app/core/const/icons_path.dart';

class DoctorSpecialistModel {
  final String title;
  final String icons;

  DoctorSpecialistModel({
    required this.title,
    required this.icons,
  });

  factory DoctorSpecialistModel.fromJson(Map<String, dynamic> json) {
    return DoctorSpecialistModel(
      title: json['title'] ?? '',
      icons: json['icons'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icons': icons,
    };
  }
}


 final List<DoctorSpecialistModel> specialistData = [
    DoctorSpecialistModel(title: "General", icons: IconsPath.general),
    DoctorSpecialistModel(title: "Ophthalmology", icons: IconsPath.ophthalmology),
    DoctorSpecialistModel(title: "Neurologist", icons: IconsPath.nutritionist),
    DoctorSpecialistModel(title: "Neurology", icons: IconsPath.neurology),
    DoctorSpecialistModel(title: "Dentist", icons: IconsPath.dentist),
    DoctorSpecialistModel(title: "Surgeon", icons: IconsPath.surgeon),
    DoctorSpecialistModel(title: "Pediatrics", icons: IconsPath.pediatrics),
    DoctorSpecialistModel(title: "Radiology", icons: IconsPath.radiology),
];