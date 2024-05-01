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

  Future<void> sendChatRequest(String prompt) async {
    try {
      final String apiKey =
          'sk-proj-y2pzulahVkmfFUwqZN9uT3BlbkFJGKiu8Nc2tsSgXTaWsMI9';
      final String endpoint = 'https://api.openai.com/v1/chat/completions';
      final Map<String, dynamic> requestData = {
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "system",
            "content": "You are a helpful assistant.",
          },
          {
            "role": "user",
            "content": prompt,
          },
        ],
      };

      final http.Response response = await http.post(
        Uri.parse(endpoint),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        setState(() {
          _response = responseData['choices'][0]['message']['content'];
        });
        print(
            "My Response data: $_response"); // Print the response to the console
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print(error);
    }
  }
}
