import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  //this is stateless widget we normally use this when we don't need to save anything
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Random_Words',
      home: RandomWords(),
       //home contains random word class that is statefull class
      //and it shows random words on the screen
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);
  //basically this classs is used here because we want to change value on screen
  //this class saves value and as well as displays on screen

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
 final _suggestions = <WordPair>[];
 //these are the the class objects which we have been created in order to call the words
 //and displays different words on the screen and for realtime display

 //here <WordPair>[]; means WordPair is class which takes [] list and this list is
 //equivalent to _suggestions so when we call  _suggestions that means we are calling list indirectly
 final _biggerFont = const TextStyle(fontSize: 20, color: Colors.red ,
 fontStyle: FontStyle.italic,
 shadows: [
   Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Color.fromARGB(230, 17, 17, 17),
      ),
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Color.fromARGB(121, 199, 199, 202),
      ),
 ]);
//here is another class that is equivalent to _biggerFont that means in this we are basically adjusing
//the size of the font that is equivalent to const TextStyle(fontSize: 18) it has const in start
//that means it takes constant value

  @override
  Widget build(BuildContext context) {
      // final wordPair = WordPair.random();
       //return Text(wordPair.asPascalCase);
       return Scaffold( 
         
         //basically scafold can only takes body or appbar
         appBar: AppBar(
           backgroundColor: Colors.black54,
            
         title: const Text("Random Words Generator", 
         style: TextStyle(color: Colors.red, 
 shadows: [
   Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Color.fromARGB(255, 17, 17, 17),
      ),
      Shadow(
        offset: Offset(2.0, 2.0),
        blurRadius: 3.0,
        color: Color.fromARGB(121, 199, 199, 202),
      ),
 ],),),
         //i'm using text wiget in order to display text on the screen
         //but you can also use this const Randomwords() instead of text widget over here over here 
         ),
         body: _buildSuggestion(),
         backgroundColor: Colors.black87,
         //we call the _buildSuggestion() function inside the body because we want to daisplay
         // those names also in the body that will generatd 
         //means those names are basically created by _buildSuggestion(), which are not exist 
         //in the list and which are existed in the list basically it created the whole row of word at a time
         //but it is infinite that's why it will displays infinitely
       );
  }
Widget _buildSuggestion() {
  //basically this function returns a widget that is called "listview" this widget basically display 
  //body content in the form of list it makes screen scrollable
  //here paddig is only used to adjust the size of the screen
   return ListView.builder( padding: const EdgeInsets.all(16), 
   
 itemBuilder: (context, i) { 
   //now i is a variable that starts from index 0
   if (i.isOdd) { 
     //it returns divider that divides the screen by 1 pixel
   return const Divider();
    } 
    final index = i ~/ 2;
    //now suppose if index is even then it will divides it by 2 and returns an integer value for the list
    //which is called wordPair
     if (index >= _suggestions.length) 
     //in the same way if the number of index we get is less than the index numbers we have
     //then we will use this block of code that's why this code is infinte because 
     //we use all cases at a time
   { 
     // ...then generate 10 more and add them to the

 //suggestions list.
  _suggestions.addAll(generateWordPairs().take(10));
  //this block generate list pairs for those iteration numbers which are not existed in the list
   }
    return _buildRow(_suggestions[index]);
    //basically _buildrow creates a row on the screen and calls the suggestions index then
     }); }
      Widget _buildRow(WordPair pair)
      //then it generates word pair
       { return ListTile( 
         
         //it creates a list in the form of tile
         title: Text( pair.asPascalCase, style: _biggerFont,  )
         );
          }


  }
  
  







