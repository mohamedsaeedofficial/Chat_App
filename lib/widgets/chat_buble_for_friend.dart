import 'package:chat/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBubleForFriend extends StatelessWidget {
   const ChatBubleForFriend({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(
          left: 12,
          right: 12,
          top: 8,
        
        ),
        padding: const EdgeInsets.all(12),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
          ),
          color: Color(0xff006387),
        ),
        child: Text(
          messageModel.message,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
