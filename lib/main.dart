import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}

class _MyAppState extends State<Myapp> { // the underscore makes the class private
  int questionIndex = 0;
  void answerQuestion(){
    print('answer chosen for index ' + questionIndex);
    setState((){
      questionIndex += 1
    })
  }

  @override
  Widget build(BuildContext context){
    const questions = [
      {
        'questiontext': 'Your favourite color?',
        'answers': [
          'black',
          'red',
          'green',
          'white'
        ]
      },
      {
        'questiontext': 'Your favourite animal?',
        'answers': [
          'cow',
          'goat',
          'snake',
          'lion'
        ]
      },
      {
        'questiontext': 'Your favourite instructor?',
        'answers': [
          'qwe',
          'qaz',
          'qsc',
          'abc'
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('First Flutter App'),
        ),
        body: Column(
          children: [
            Question(
              questions[questionIndex]['questionText'],
            ),
            ...(questions[questionIndex]['answers'] as List<String>).map((answer){
              return Answer(answerQuestion, answer)
            }).toList()
          ],
        ),
      ),
    );
  }
}