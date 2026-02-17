class FaqModel {
  final String question;
  final String answer;
  final String category;
  bool isExpanded;

  FaqModel({
    required this.question,
    required this.answer,
    required this.category,
    this.isExpanded = false,
  });
}