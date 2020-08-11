import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText;

  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
        padding: EdgeInsets.all(5),
        child: RaisedButton(
            color: Colors.blueGrey,
            textColor: Colors.white,
            child: Text(answerText),
            onPressed: selectHandler));
  }
}
