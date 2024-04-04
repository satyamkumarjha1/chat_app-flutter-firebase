import 'package:flutter/material.dart';

class ChatBox extends StatelessWidget {
  final String message;
  final bool isCurrentUser;

  const ChatBox(
      {super.key, required this.message, required this.isCurrentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isCurrentUser
              ? const Color(0xFF80A681)
              : const Color(0xFFB97470)),
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 3,
      ),
      child: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
