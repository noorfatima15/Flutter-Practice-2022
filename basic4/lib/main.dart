import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    return const MaterialApp(
      title: "random words generating application",
      debugShowCheckedModeBanner: false,
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
    final _biggerfont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    //final wordPair = WordPair.random();
    //return Text(wordPair.asPascalCase);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Words Generator'),
      ),
      body: _buildSuggestion(),
    );
  
}
Widget _buildSuggestion(){
return ListView.builder(
  padding: const EdgeInsets.all(16),
  itemBuilder: (context,i){
    if (i.isOdd){
      return const Divider();
    }
    final index = i~/2;
    if(index >= _suggestions.length){
      _suggestions.addAll(generateWordPairs().take(10));
    }
    return _buildRow(_suggestions[index]);
  }
);
}
Widget _buildRow(WordPair pair){
  return ListTile(
    title: Text(
      pair.asPascalCase,
      style: _biggerfont,
    ),
  );
}
}