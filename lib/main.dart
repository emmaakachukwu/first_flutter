import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  // the underscore makes the class private
  final questions = const [
    {
      'questionText': 'Your favourite color?',
      'answers': [
        {'text': 'black', 'score': 10},
        {'text': 'red', 'score': 5},
        {'text': 'green', 'score': 3},
        {'text': 'white', 'score': 1},
      ]
    },
    {
      'questionText': 'Your favourite animal?',
      'answers': [
        {'text': 'cow', 'score': 5},
        {'text': 'goat', 'score': 5},
        {'text': 'snake', 'score': 10},
        {'text': 'dog', 'score': 3},
      ]
    },
    {
      'questionText': 'Your favourite instructor?',
      'answers': [
        {'text': 'abc', 'score': 3},
        {'text': 'acb', 'score': 3},
        {'text': 'bac', 'score': 3},
        {'text': 'cab', 'score': 3},
      ]
    },
  ];
  int questionIndex = 0;
  int totalScore = 0;
  void answerQuestion(int score) {
    totalScore += score;
    setState(() {
      questionIndex += 1;
    });
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('First Flutter App'),
        ),
        body: questionIndex < questions.length
            ? Quiz(
                answerQuestion: answerQuestion,
                questionIndex: questionIndex,
                questions: questions)
            : Result(totalScore, resetQuiz),
      ),
    );
  }
}
