import 'package:flaguru/models/Answer.dart';
import 'package:flutter/material.dart';

class FlagButton extends StatelessWidget {
  final Answer answer;
  final num width;
  final Function doRight;
  final Function doWrong;
  final bool isAnswered;
  final bool isPressed;
  final Function changePressState;

  FlagButton({
    @required this.answer,
    @required this.width,
    @required this.doRight,
    @required this.doWrong,
    @required this.isAnswered,
    @required this.isPressed,
    @required this.changePressState,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(5);

    List<Widget> dotAnnotator(Color color) => [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Colors.transparent,
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: Container(
              width: 14,
              height: 14,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(
                  color: Colors.white,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(7),
              ),
            ),
          ),
        ];

    return Stack(
      children: <Widget>[
        Material(
          elevation: (!isAnswered || isPressed) ? 5 : 0,
          borderRadius: borderRadius,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: borderRadius,
              border: Border.all(color: Colors.white, width: 1),
            ),
            height: width / 1.7,
            width: width,
            child: ClipRRect(
              borderRadius: borderRadius,
              child: Image.asset(
                answer.imageUrl,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            borderRadius: borderRadius,
            child: InkWell(
              borderRadius: borderRadius,
              onTap: () {
                answer.isRight ? doRight() : doWrong();
                changePressState();
              },
            ),
          ),
        ),
        if (isAnswered && !isPressed)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: borderRadius,
                color: Color(0xff019dad).withOpacity(0.5),
              ),
            ),
          ),
        if (isAnswered && answer.isRight) ...dotAnnotator(Colors.green[300]),
        if (isAnswered && isPressed && !answer.isRight)
          ...dotAnnotator(Colors.red[300]),
      ],
    );
  }
}
