import 'package:flutter/material.dart';
import 'package:vanilla_bloc/views/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Vanilla bloc",
      home: HomeMainView()
    );
  }
}