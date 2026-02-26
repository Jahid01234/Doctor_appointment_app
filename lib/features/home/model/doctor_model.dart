import 'package:doctor_appointment_app/core/const/images_path.dart';
import 'package:doctor_appointment_app/features/home/model/review_model.dart';

class DoctorModel {
  final String name;
  final String image;
  final String department;
  final String description;
  final String hospitalName;
  final double rating;
  final int reviewsCount;
  final List<ReviewModel> reviews;
  final int patientsCount;
  final int experienceYear;
  final String workingSchedule;

  DoctorModel({
    required this.name,
    required this.image,
    required this.department,
    required this.description,
    required this.hospitalName,
    required this.rating,
    required this.reviewsCount,
    required this.reviews,
    required this.patientsCount,
    required this.experienceYear,
    required this.workingSchedule,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      department: json['department'] ?? '',
      description: json['description'] ?? '',
      hospitalName: json['hospitalName'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
      reviewsCount: json['reviewsCount'] ?? 0,
      reviews: (json['reviews'] as List<dynamic>? ?? [])
          .map((e) => ReviewModel.fromJson(e))
          .toList(),
      patientsCount: json['patientsCount'] ?? 0,
      experienceYear: json['experienceYear'] ?? 0,
      workingSchedule: json['workingSchedule'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'department': department,
      'description': description,
      'hospitalName': hospitalName,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
      'patientsCount': patientsCount,
      'experienceYear': experienceYear,
      'workingSchedule': workingSchedule,
    };
  }
}

final List<DoctorModel> doctorsData = [
  DoctorModel(
    name: "Dr. John Smith",
    image: ImagesPath.d1,
    department: "General",
    description: "Experienced general physician.",
    hospitalName: "City Hospital",
    rating: 4.8,
    reviewsCount: 2,
    reviews: [
      ReviewModel(
        userName: "Alex",
        userImage: "assets/images/user1.png",
        rating: 5,
        comment: "Very good doctor.",
        date: "12 Feb 2026",
      ),
      ReviewModel(
        userName: "Hasan",
        userImage: "assets/images/user2.png",
        rating: 4.5,
        comment: "Helpful and polite.",
        date: "10 Feb 2026",
      ),
    ],
    patientsCount: 1500,
    experienceYear: 12,
    workingSchedule: "Mon - Fri (10:00 AM - 4:00 PM)",
  ),

  DoctorModel(
    name: "Dr. Sarah Lee",
    image: ImagesPath.d2,
    department: "Ophthalmology",
    description: "Eye specialist and surgeon.",
    hospitalName: "Vision Care Clinic",
    rating: 4.7,
    reviewsCount: 2,
    reviews: [],
    patientsCount: 980,
    experienceYear: 9,
    workingSchedule: "Sat - Thu (9:00 AM - 2:00 PM)",
  ),

  DoctorModel(
    name: "Dr. Michael Brown",
    image: ImagesPath.d3,
    department: "Neurologist",
    description: "Brain and nerve disorder expert.",
    hospitalName: "Neuro Center",
    rating: 4.9,
    reviewsCount: 3,
    reviews: [],
    patientsCount: 2000,
    experienceYear: 15,
    workingSchedule: "Mon - Wed (11:00 AM - 5:00 PM)",
  ),

  DoctorModel(
    name: "Dr. Emma Wilson",
    image: ImagesPath.d4,
    department: "Neurology",
    description: "Specialist in neurological diseases.",
    hospitalName: "Brain Hospital",
    rating: 4.6,
    reviewsCount: 1,
    reviews: [],
    patientsCount: 870,
    experienceYear: 8,
    workingSchedule: "Sun - Thu (10:00 AM - 3:00 PM)",
  ),

  DoctorModel(
    name: "Dr. David Miller",
    image: ImagesPath.d5,
    department: "Dentist",
    description: "Cosmetic and general dentist.",
    hospitalName: "Smile Dental Care",
    rating: 4.5,
    reviewsCount: 4,
    reviews: [],
    patientsCount: 1200,
    experienceYear: 10,
    workingSchedule: "Sat - Thu (9:00 AM - 1:00 PM)",
  ),

  DoctorModel(
    name: "Dr. Olivia Davis",
    image: ImagesPath.d6,
    department: "Surgeon",
    description: "Expert in general surgeries.",
    hospitalName: "Central Medical College",
    rating: 4.8,
    reviewsCount: 5,
    reviews: [],
    patientsCount: 1750,
    experienceYear: 14,
    workingSchedule: "Mon - Thu (12:00 PM - 6:00 PM)",
  ),

  DoctorModel(
    name: "Dr. William Garcia",
    image: ImagesPath.d7,
    department: "Pediatrics",
    description: "Child health specialist.",
    hospitalName: "Kids Care Hospital",
    rating: 4.9,
    reviewsCount: 3,
    reviews: [],
    patientsCount: 2100,
    experienceYear: 11,
    workingSchedule: "Sun - Wed (9:00 AM - 2:00 PM)",
  ),

  DoctorModel(
    name: "Dr. Sophia Martinez",
    image: ImagesPath.d8,
    department: "Radiology",
    description: "Diagnostic imaging expert.",
    hospitalName: "Diagnostic Center",
    rating: 4.6,
    reviewsCount: 2,
    reviews: [],
    patientsCount: 640,
    experienceYear: 7,
    workingSchedule: "Mon - Fri (8:00 AM - 1:00 PM)",
  ),

  DoctorModel(
    name: "Dr. James Anderson",
    image: ImagesPath.d9,
    department: "General",
    description: "Family medicine specialist.",
    hospitalName: "Community Clinic",
    rating: 4.4,
    reviewsCount: 1,
    reviews: [],
    patientsCount: 540,
    experienceYear: 6,
    workingSchedule: "Sat - Thu (10:00 AM - 1:00 PM)",
  ),

  DoctorModel(
    name: "Dr. Isabella Thomas",
    image: ImagesPath.d10,
    department: "Dentist",
    description: "Orthodontics and dental care expert.",
    hospitalName: "Perfect Smile Dental",
    rating: 4.7,
    reviewsCount: 2,
    reviews: [],
    patientsCount: 890,
    experienceYear: 9,
    workingSchedule: "Sun - Wed (11:00 AM - 4:00 PM)",
  ),
];
