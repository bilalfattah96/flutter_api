import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class joke extends StatefulWidget {
  const joke({super.key});

  @override
  State<joke> createState() => _jokeState();
}

class _jokeState extends State<joke> {
  String joke = 'Press The button to get joke';
  //function
  Future<void> fetchJoke() async {
    setState(() {
      joke = 'Loading';
    });
    final url = Uri.parse('https://icanhazdadjoke.com/');
    final response = await http.get(url,
        headers: {'Accept': 'application/json', 'User-Agent': 'learning app'});
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        joke = data['joke'];
        print(joke);
      });
    }
    else{
       setState(() {
        joke = 'Failed to load joke';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
