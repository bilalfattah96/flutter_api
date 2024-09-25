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
  String joke1 = '';
  //function
  Future<void> fetchJoke() async {
    setState(() {
      joke = 'Loading...';
      joke1 = 'Loading...';
    });
    final url = Uri.parse('https://api.chucknorris.io/jokes/random');
    final url1 = Uri.parse('https://icanhazdadjoke.com/');
    final response = await http.get(url);
    final response1 = await http.get(url1,
        headers: {'Accept': 'application/json', 'User-Agent': 'learning app'});
    if (response1.statusCode == 200) {
      final data = json.decode(response1.body);
      setState(() {
        joke1 = data['joke'];
        print(joke);
      });
    } else {
      setState(() {
        joke = 'Failed to load joke';
      });
    }
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        joke = data['value'];
        print(joke);
      });
    } else {
      setState(() {
        joke = 'Failed to load joke';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Joke App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              joke,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              joke1,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,color: Colors.blue),
            ),
            ElevatedButton(
              onPressed: fetchJoke,
              child: Text('New Joke'),
            ),
          ],
        ),
      ),
    );
  }
}
