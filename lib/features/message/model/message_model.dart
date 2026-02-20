class MessageModel {
  final String id;
  final String doctorName;
  final String specialty;
  final String lastMessage;
  final DateTime timestamp;
  final String avatarUrl;
  final bool isOnline;
  final int unreadCount;

  MessageModel({
    required this.id,
    required this.doctorName,
    required this.specialty,
    required this.lastMessage,
    required this.timestamp,
    required this.avatarUrl,
    this.isOnline = false,
    this.unreadCount = 0,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'] as String,
      doctorName: json['doctorName'] as String,
      specialty: json['specialty'] as String,
      lastMessage: json['lastMessage'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      avatarUrl: json['avatarUrl'] as String,
      isOnline: json['isOnline'] as bool? ?? false,
      unreadCount: json['unreadCount'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctorName': doctorName,
      'specialty': specialty,
      'lastMessage': lastMessage,
      'timestamp': timestamp.toIso8601String(),
      'avatarUrl': avatarUrl,
      'isOnline': isOnline,
      'unreadCount': unreadCount,
    };
  }

  MessageModel copyWith({
    String? id,
    String? doctorName,
    String? specialty,
    String? lastMessage,
    DateTime? timestamp,
    String? avatarUrl,
    bool? isOnline,
    int? unreadCount,
  }) {
    return MessageModel(
      id: id ?? this.id,
      doctorName: doctorName ?? this.doctorName,
      specialty: specialty ?? this.specialty,
      lastMessage: lastMessage ?? this.lastMessage,
      timestamp: timestamp ?? this.timestamp,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      isOnline: isOnline ?? this.isOnline,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is MessageModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() =>
      'MessageModel(id: $id, doctorName: $doctorName, specialty: $specialty, '
          'lastMessage: $lastMessage, isOnline: $isOnline, unreadCount: $unreadCount)';
}