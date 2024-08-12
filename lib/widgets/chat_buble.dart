import 'package:chat/constants.dart';
import 'package:chat/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatBuble extends StatelessWidget {
   const ChatBuble({
    super.key,
    required this.messageModel,
  });
  final MessageModel messageModel;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
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
            bottomRight: Radius.circular(16),
          ),
          color: kPrimaryColor,
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
