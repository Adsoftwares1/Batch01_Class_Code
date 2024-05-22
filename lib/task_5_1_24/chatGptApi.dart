import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ChatGPTAPI extends StatefulWidget {
  const ChatGPTAPI({super.key});

  @override
  State<ChatGPTAPI> createState() => _ChatGPTAPIState();
}

class _ChatGPTAPIState extends State<ChatGPTAPI> {
  String _response = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                await sendChatRequest("Are you intelligent then me");
              },
              child: Text("Click here to hit api"),
            ),
            Text("My Gpt response: $_response"),
          ],
        ),
      ),
    );
  }

  Future<void> sendChatRequest(String prompt) async {}
}
