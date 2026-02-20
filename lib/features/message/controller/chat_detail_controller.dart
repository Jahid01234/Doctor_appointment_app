import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/chat_bubble_model.dart';
import '../model/message_model.dart';

class ChatDetailController extends GetxController {
  final MessageModel doctor;
  ChatDetailController({required this.doctor});

  var messages = <ChatBubble>[].obs;
  var isTyping = false.obs;
  var isSending = false.obs;
  final TextEditingController textController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    _loadInitialMessages();
  }


  void _loadInitialMessages() {
    final now = DateTime.now();
    messages.assignAll([
      ChatBubble(
        id: '1',
        text: 'Hello! How can I help you today?',
        time: now.subtract(const Duration(minutes: 30)),
        isSentByMe: false,
      ),
      ChatBubble(
        id: '2',
        text: 'Hi Doctor, I have been feeling dizzy lately.',
        time: now.subtract(const Duration(minutes: 28)),
        isSentByMe: true,
      ),
      ChatBubble(
        id: '3',
        text: 'I see. How long have you been experiencing this? Any other symptoms?',
        time: now.subtract(const Duration(minutes: 26)),
        isSentByMe: false,
      ),
      ChatBubble(
        id: '4',
        text: 'About 3 days. I also have mild headaches in the morning.',
        time: now.subtract(const Duration(minutes: 24)),
        isSentByMe: true,
      ),
      ChatBubble(
        id: '5',
        text: 'That could be related to dehydration or blood pressure. Are you drinking enough water?',
        time: now.subtract(const Duration(minutes: 20)),
        isSentByMe: false,
      ),
      ChatBubble(
        id: '6',
        text: 'Probably not as much as I should 😅',
        time: now.subtract(const Duration(minutes: 18)),
        isSentByMe: true,
      ),
      ChatBubble(
        id: '7',
        text: 'Try drinking at least 8 glasses per day and monitor your symptoms. If it persists, we should run some tests.',
        time: now.subtract(const Duration(minutes: 15)),
        isSentByMe: false,
      ),
    ]);

    _scrollToBottom();
  }

  void sendMessage() async {
    final text = textController.text.trim();
    if (text.isEmpty) return;

    textController.clear();
    isSending(true);

    // Add user message
    messages.add(ChatBubble(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      time: DateTime.now(),
      isSentByMe: true,
    ));
    _scrollToBottom();

    // Simulate doctor typing
    await Future.delayed(const Duration(milliseconds: 500));
    isTyping(true);
    await Future.delayed(const Duration(seconds: 2));
    isTyping(false);

    // Simulate doctor reply
    messages.add(ChatBubble(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: _generateReply(text),
      time: DateTime.now(),
      isSentByMe: false,
    ));

    isSending(false);
    _scrollToBottom();
  }

  String _generateReply(String userMessage) {
    final msg = userMessage.toLowerCase();
    if (msg.contains('pain') || msg.contains('hurt')) {
      return 'I understand. Can you describe the pain — is it sharp, dull, or throbbing? And where exactly?';
    } else if (msg.contains('fever') || msg.contains('temperature')) {
      return 'What is your current temperature reading? Are you taking any medication?';
    } else if (msg.contains('thank')) {
      return 'You\'re welcome! Take care and feel better soon 😊';
    } else if (msg.contains('appointment') || msg.contains('visit')) {
      return 'Sure! I can schedule you for a visit. What date works best for you?';
    } else if (msg.contains('medicine') || msg.contains('medication')) {
      return 'Please do not stop any medication without consulting me first. What medicine are you referring to?';
    } else if (msg.contains('ok') || msg.contains('okay') || msg.contains('alright')) {
      return 'Great! Don\'t hesitate to reach out if anything changes. I\'m here to help 🙂';
    } else {
      final replies = [
        'I see. Let me review your case further. Can you give me more details?',
        'Thank you for sharing that. I recommend we monitor this closely.',
        'Understood. Make sure to rest well and stay hydrated.',
        'That\'s helpful information. I\'ll note this in your records.',
        'Okay, based on what you\'re describing, let\'s take it step by step.',
      ];
      return replies[DateTime.now().second % replies.length];
    }
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  String formatBubbleTime(DateTime time) {
    final hour = time.hour % 12 == 0 ? 12 : time.hour % 12;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.hour >= 12 ? 'PM' : 'AM';
    return '$hour:$minute $period';
  }

  @override
  void onClose() {
    textController.dispose();
    scrollController.dispose();
    super.onClose();
  }
}