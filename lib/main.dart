import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'Text': 'Black', 'Score': 10},
        {'Text': 'Red', 'Score': 5},
        {'Text': 'Green', 'Score': 3},
        {'Text': 'White', 'Score': 1}
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'Text': 'Rabbit', 'Score': 10},
        {'Text': 'Snake', 'Score': 5},
        {'Text': 'Elephant', 'Score': 3},
        {'Text': 'Lion', 'Score': 1}
      ]
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'Text': 'Max', 'Score': 10},
        {'Text': 'Esteban', 'Score': 5},
        {'Text': 'Fernando', 'Score': 3},
        {'Text': 'Juan', 'Score': 1}
      ]
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    
  }

  void _answerQuestion(int score) {

    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
