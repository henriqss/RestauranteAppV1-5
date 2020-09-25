import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:restauranteapp/chat/chat_screen.dart';

void chat(){
  runApp(ChatScreen());
}

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}