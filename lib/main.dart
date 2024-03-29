
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() {
  final wordPair = WordPair.random();
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('app bar'),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body:  Center(
            child: RandomWords(),),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Text('click'),
        ),
      ),
    ),
  );
}


class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {

  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }
  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: /*1*/ (context, i) {
          if (i.isOdd) return const Divider(); /*2*/

          final index = i ~/ 2; /*3*/
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10)); /*4*/
          }
          return _buildRow(_suggestions[index]);
        });
  }
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}

