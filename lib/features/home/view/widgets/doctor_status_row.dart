import 'package:doctor_appointment_app/features/home/model/doctor_model.dart';
import 'package:doctor_appointment_app/features/home/view/widgets/doctor_status_item.dart';
import 'package:flutter/material.dart';

class DoctorStatsRow extends StatelessWidget {
  final DoctorModel doctor;
  const DoctorStatsRow({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DoctorStatItem(
          icon: Icons.people_alt_outlined,
          value: '${doctor.patientsCount}+',
          label: 'Patients',
        ),
        DoctorStatItem(
          icon: Icons.trending_up,
          value: '${doctor.experienceYear}+',
          label: 'Years experience.',
        ),
        DoctorStatItem(
          icon: Icons.star_border,
          value: doctor.rating.toString(),
          label: 'Rating',
        ),
        DoctorStatItem(
          icon: Icons.reviews,
          value: doctor.reviewsCount.toString(),
          label: 'Reviews',
        ),
      ],
    );
  }
}