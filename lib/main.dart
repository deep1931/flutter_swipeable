import 'package:flutter/material.dart';
import 'package:flutter_swipeable/chat_detail_screen.dart';
import 'package:flutter_swipeable/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ChatDetailScreen(),
    );
  }
}
