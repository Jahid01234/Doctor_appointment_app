class NotificationModel{
  final String title;
  final String subTitle;
  final DateTime dateTime;

  NotificationModel({
    required this.title,
    required this.subTitle,
    required this.dateTime,
  });
}


final List<NotificationModel> notificationData =[
  NotificationModel(
    title: "Appointment Success......",
    subTitle: "You have successfully booked your appointment with Dr. Emily Walker."
        " Please arrive at the clinic at least 10 minutes before your scheduled time "
        "and bring any relevant medical documents for a smooth consultation.",
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    title: "New message......",
    subTitle: "Scheduled maintenance will occur tonight in 2 AM. Please join the meeting everyone.",
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    title: "Appointment Cancelled",
    subTitle: "You have successfully cancelled your appointment with Dr. David Patel.",
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    title: "Scheduled Changed",
    subTitle: "You have successfully changes your appointment with Dr. Jesica Turner.",
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    title: "Appointment success",
    subTitle: "You have successfully booked your appointment with Dr. David Patel.",
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    title: "Appointment Cancelled",
    subTitle: "You have successfully cancelled your appointment with Dr. David Patel.",
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    title: "Scheduled Changed",
    subTitle: "You have successfully changes your appointment with Dr. Jesica Turner.",
    dateTime: DateTime.now(),
  ),
  NotificationModel(
    title: "Appointment success",
    subTitle: "You have successfully booked your appointment with Dr. David Patel.",
    dateTime: DateTime.now(),
  ),
];