import 'package:flutter/material.dart';
import 'package:intrack_social_dimension/widget/story_text_widget.dart';
import 'package:intrack_social_dimension/widget/story_widget.dart';
import 'flutter_flow/nav/nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StoryWidget(),
    );
  }
}