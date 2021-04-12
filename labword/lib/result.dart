import 'package:flutter/material.dart';

class Result extends StatelessWidget{
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);
  String get resultPhrase{
    String resultText;
    if(resultScore <= 1){
      resultText = 'You are not a sports fan';
    }
    else if(resultScore <= 4){
      resultText = 'You are an intermediate sports fan';
    }
    else if(resultScore <= 5){
      resultText = 'You are an expert sports fan';
    }
    else{
      resultText = 'You are not a sports fan';
    }
    return resultText;
  }
  @override
  Widget build(BuildContext context){
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(onPressed: resetHandler, child: Text('Restart Quiz!'))
        ],
      ),
    );
  }
}