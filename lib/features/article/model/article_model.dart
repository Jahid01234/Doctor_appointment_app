import 'package:doctor_appointment_app/core/const/images_path.dart';


class ArticleModel {
  final String title;
  final String image;
  final String description;
  final String tag;
  final String dateTime;

  ArticleModel ({
    required this.title,
    required this.image,
    required this.description,
    required this.tag,
    required this.dateTime,
  });
}

final List<ArticleModel> articlesData = [
  ArticleModel(
    title: "Dr. John Smith knfjk  kkgjkjg  kjkgktjg  jjgjg  jjjg kjjgj  kjgkgjj jkg ",
    image: ImagesPath.d1,
    description: "An Experienced General Physician is a highly skilled medical doctor",
    tag: "Health",
    dateTime: "Dec, 2026"
  ),

  ArticleModel(
      title: "Dr. John Smith",
      image: ImagesPath.d2,
      description: "An Experienced General Physician is a highly skilled medical doctor",
      tag: "LifeStyle",
      dateTime: "Dec, 2026"
  ),
];
