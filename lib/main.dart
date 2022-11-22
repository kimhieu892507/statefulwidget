import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return MaterialApp(
      title: "Welcome to Flutter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Example"),
        ),
        body: Center(
          child: RandomWords(),
        ),
      ),
    );
  }
}

class RandomWords extends StatefulWidget{
  @override
  RandomWordsState createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords>{
  final List<WordPair >_words = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final Set<WordPair> _saved = new Set<WordPair>();
  @override
  Widget build(BuildContext context){
    final wordPair = WordPair.random();
    return ListView.builder(
        itemBuilder: (context,index){
          if(index.isOdd)
            return Divider();
          
          if(index >= _words.length){
            _words.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_words[index]);   
        });
  }
  
  Widget _buildRow(WordPair wordPair){
    final bool alreadySaved = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved? Icons.favorite:Icons.favorite_border,
        color: alreadySaved? Colors.red : null,),  //add thêm sau đuôi
    onTap: (){
        setState(() {
          if(alreadySaved){
            _saved.remove(wordPair);
          }
          else{
            _saved.add(wordPair);
          }
        });
    }
    );
    
  }
}

