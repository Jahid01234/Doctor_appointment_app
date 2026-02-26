class ReviewModel {
  final String userName;
  final String userImage;
  final double rating;
  final String comment;
  final String date;

  ReviewModel({
    required this.userName,
    required this.userImage,
    required this.rating,
    required this.comment,
    required this.date,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      userName: json['userName'] ?? '',
      userImage: json['userImage'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      comment: json['comment'] ?? '',
      date: json['date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'userImage': userImage,
      'rating': rating,
      'comment': comment,
      'date': date,
    };
  }
}