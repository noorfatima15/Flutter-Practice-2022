import 'package:english_words/english_words.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Random dictionary',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          title: const Text(
            'Welcome to Flutter',
            style: TextStyle(
                //backgroundColor: Colors.deepOrange,
                color: Colors.deepOrange,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                letterSpacing: 8,
                wordSpacing: 20,
                fontFamily: 'RobotoSlab',
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                      color: Colors.grey, offset: Offset(2, 1), blurRadius: 10)
                ]),
          ),
        ),
        body: Center(
          // Drop the const, and

//child: Text('Hello World'), // Replace this text...

          child: Text(
            wordPair.asPascalCase,
            style: const TextStyle(
                //backgroundColor: Colors.deepOrange,
                color: Colors.deepOrange,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                letterSpacing: 8,
                wordSpacing: 20,
                fontFamily: 'RobotoSlab',
                fontWeight: FontWeight.w700,
                shadows: [
                  Shadow(
                      color: Colors.grey, offset: Offset(2, 1), blurRadius: 10)
                ]),
          ),
          // With this text..
        ),
        backgroundColor: Colors.grey[800],
      ),
    );
  }
}
