import 'package:doctor_appointment_app/core/const/images_path.dart';

class AppointmentModel {
  final String doctorName;
  final String doctorImage;
  final String type;
  final String date;
  final String time;
  final String status;

  AppointmentModel({
    required this.doctorName,
    required this.doctorImage,
    required this.type,
    required this.date,
    required this.time,
    required this.status,
  });
}

final List<AppointmentModel> appointmentsData = <AppointmentModel>[
  AppointmentModel(
    doctorName: "Dr. John Smith",
    doctorImage: ImagesPath.d1,
    type: "Messaging",
    date: "Today",
    time: "10:00 AM",
    status: "Upcoming",
  ),
  AppointmentModel(
    doctorName: "Dr. Sarah Lee",
    doctorImage: ImagesPath.d2,
    type: "Audio Call",
    date: "Nov 22, 2022",
    time: "08:00 AM",
    status: "Completed",
  ),
  AppointmentModel(
    doctorName: "Dr. Michael Brown",
    doctorImage: ImagesPath.d3,
    type: "Audio Call",
    date: "Nov 02, 2022",
    time: "11:00 PM",
    status: "Cancelled",
  ),

  AppointmentModel(
    doctorName: "Dr. Emma Wilson",
    doctorImage: ImagesPath.d4,
    type: "Audio Call",
    date: "Today",
    time: "10:00 AM",
    status: "Upcoming",
  ),
  AppointmentModel(
    doctorName: "Dr. David Miller",
    doctorImage: ImagesPath.d5,
    type: "Messaging",
    date: "Nov 22, 2022",
    time: "08:00 AM",
    status: "Completed",
  ),
  AppointmentModel(
    doctorName: "Dr. Olivia Davis",
    doctorImage: ImagesPath.d6,
    type: "Messaging",
    date: "Nov 02, 2022",
    time: "11:00 PM",
    status: "Cancelled",
  ),
  AppointmentModel(
    doctorName: "Dr. William Garcia",
    doctorImage: ImagesPath.d7,
    type: "Messaging",
    date: "Today",
    time: "10:00 AM",
    status: "Upcoming",
  ),
  AppointmentModel(
    doctorName: "Dr. Sophia Martinez",
    doctorImage: ImagesPath.d8,
    type: "Audio Call",
    date: "Nov 22, 2022",
    time: "08:00 AM",
    status: "Completed",
  ),
  AppointmentModel(
    doctorName: "Dr. James Anderson",
    doctorImage: ImagesPath.d9,
    type: "Video Call",
    date: "Nov 02, 2022",
    time: "11:00 PM",
    status: "Completed",
  ),
  AppointmentModel(
    doctorName: "Dr. Isabella Thomas",
    doctorImage: ImagesPath.d10,
    type: "Video Call",
    date: "Today",
    time: "10:00 AM",
    status: "Upcoming",
  ),
  AppointmentModel(
    doctorName: "Dr. James Anderson",
    doctorImage: ImagesPath.d9,
    type: "Audio Call",
    date: "Nov 02, 2022",
    time: "11:00 PM",
    status: "Cancelled",
  ),
];