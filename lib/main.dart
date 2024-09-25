import 'package:apiproject/joke.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyAPI());
}

class MyAPI extends StatelessWidget {
  const MyAPI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: joke(),
    );
  }
}