import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyAppState();
  }
}
class _MyAppState extends State<MyApp>{
  final _questions = const[
    {
      'questionText': 'What is Usain Bolt’s 100m world record time?',
      'answers': [
        {'text': '9.73', 'score':0},
        {'text': '9.69', 'score':0},
        {'text': '9.58', 'score':1},
        {'text': '9.63', 'score':0},
     ],
    },
    {
      'questionText': 'The LA Lakers and New York Knicks play which sport?',
      'answers': [
        {'text': 'Basketball', 'score':1},
        {'text': 'Football', 'score':0},
        {'text': 'Hockey', 'score':0},
        {'text': 'Rugby', 'score':0},
     ],
    },
    {
      'questionText': 'Who is the Premier League’s all-time top scorer?',
      'answers': [
        {'text': 'Wayne Rooney', 'score':0},
        {'text': 'Thiery Henry', 'score':0},
        {'text': 'Jamie Vardy', 'score':0},
        {'text': 'Alan Shearer', 'score':1},
     ],
    },
    {
      'questionText': 'Who won the 2003 Badminton All England Championship?',
      'answers': [
        {'text': 'Hafiz Hashim', 'score':1},
        {'text': 'Lee Chong Wei', 'score':0},
        {'text': 'Taufik Hidayat', 'score':0},
        {'text': 'Peter Gade', 'score':0},
     ],
    },
    {
      'questionText': 'Which Tennis Grand Slam is played on clay court?',
      'answers': [
        {'text': 'French Open', 'score':1},
        {'text': 'Wimbledon', 'score':0},
        {'text': 'US Open', 'score':0},
        {'text': 'Australian Open', 'score':0},
     ],
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
  void _answerQuestion(int score){
    _totalScore += score;

    setState(() {
          _questionIndex++;
    });
  }
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar : AppBar(
          backgroundColor : Color.fromARGB(255, 252, 158, 79),
          title: Text('Ultimate Sports Quiz!'), 
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
            )
            :Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
