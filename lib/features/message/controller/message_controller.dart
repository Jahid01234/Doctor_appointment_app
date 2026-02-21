import 'package:doctor_appointment_app/features/message/model/message_model.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  var chats = <MessageModel>[].obs;
  var filteredChats = <MessageModel>[].obs;
  var isLoading = true.obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchChats();
    ever(searchQuery, (_) => filterChats());
  }

  void fetchChats() async {
    isLoading(true);
    await Future.delayed(const Duration(milliseconds: 800));

    final data = [
      MessageModel(
        id: '1',
        doctorName: 'Dr. Drake Boeson',
        specialty: 'Cardiologist',
        lastMessage: 'My pleasure. All the best for you!',
        timestamp: DateTime.now(),
        avatarUrl: 'https://randomuser.me/api/portraits/men/32.jpg',
        isOnline: true,
        unreadCount: 0,
      ),
      MessageModel(
        id: '2',
        doctorName: 'Dr. Aidan Allende',
        specialty: 'Neurologist',
        lastMessage: 'Your solution is great! 🔥🔥',
        timestamp: DateTime.now().subtract(const Duration(days: 1)),
        avatarUrl: 'https://randomuser.me/api/portraits/men/44.jpg',
        isOnline: true,
        unreadCount: 2,
      ),
      MessageModel(
        id: '3',
        doctorName: 'Dr. Salvatore Heredia',
        specialty: 'Orthopedic',
        lastMessage: 'Thanks for the help doctor 🙏',
        timestamp: DateTime(2022, 12, 20, 10, 30),
        avatarUrl: 'https://randomuser.me/api/portraits/men/56.jpg',
        isOnline: false,
        unreadCount: 0,
      ),
      MessageModel(
        id: '4',
        doctorName: 'Dr. Delaney Mangino',
        specialty: 'Dermatologist',
        lastMessage: 'I have recovered, thank you very much!',
        timestamp: DateTime(2022, 12, 14, 17, 0),
        avatarUrl: 'https://randomuser.me/api/portraits/men/22.jpg',
        isOnline: false,
        unreadCount: 1,
      ),
      MessageModel(
        id: '5',
        doctorName: 'Dr. Beckett Calger',
        specialty: 'Ophthalmologist',
        lastMessage: 'I went there yesterday 😊',
        timestamp: DateTime(2022, 11, 26, 9, 30),
        avatarUrl: 'https://randomuser.me/api/portraits/women/33.jpg',
        isOnline: true,
        unreadCount: 0,
      ),
      MessageModel(
        id: '6',
        doctorName: 'Dr. Bernard Bliss',
        specialty: 'Psychiatrist',
        lastMessage: 'IDK what else is there to do ...',
        timestamp: DateTime(2022, 11, 9, 10, 0),
        avatarUrl: 'https://randomuser.me/api/portraits/men/67.jpg',
        isOnline: false,
        unreadCount: 3,
      ),
      MessageModel(
        id: '7',
        doctorName: 'Dr. Jada Srnsky',
        specialty: 'Pediatrician',
        lastMessage: 'I advise you to take a break 🛌',
        timestamp: DateTime(2022, 10, 18, 15, 30),
        avatarUrl: 'https://randomuser.me/api/portraits/women/45.jpg',
        isOnline: true,
        unreadCount: 0,
      ),
      MessageModel(
        id: '8',
        doctorName: 'Dr. Randy Wigham',
        specialty: 'General Physician',
        lastMessage: 'Yeah! You\'re right 💯',
        timestamp: DateTime(2022, 10, 7, 10, 0),
        avatarUrl: 'https://randomuser.me/api/portraits/women/68.jpg',
        isOnline: false,
        unreadCount: 0,
      ),
    ];

    chats.assignAll(data);
    filteredChats.assignAll(data);
    isLoading(false);
  }

  void filterChats() {
    if (searchQuery.value.isEmpty) {
      filteredChats.assignAll(chats);
    } else {
      filteredChats.assignAll(chats.where((chat) =>
      chat.doctorName
          .toLowerCase()
          .contains(searchQuery.value.toLowerCase()) ||
          chat.lastMessage
              .toLowerCase()
              .contains(searchQuery.value.toLowerCase())));
    }
  }

  void onSearch(String query) => searchQuery.value = query;

  void markAsRead(String chatId) {
    final index = chats.indexWhere((c) => c.id == chatId);
    if (index != -1) {
      chats[index] = chats[index].copyWith(unreadCount: 0);
      filterChats();
    }
  }

  String formatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final msgDate = DateTime(timestamp.year, timestamp.month, timestamp.day);

    if (msgDate == today) {
      return 'Today,\n${_formatTime(timestamp)}';
    } else if (msgDate == yesterday) {
      return 'Yesterday,\n${_formatTime(timestamp)}';
    } else {
      return '${timestamp.day.toString().padLeft(2, '0')}/'
          '${timestamp.month.toString().padLeft(2, '0')}/'
          '${timestamp.year},\n${_formatTime(timestamp)}';
    }
  }

  String _formatTime(DateTime time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }
}