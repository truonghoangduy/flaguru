import 'package:flaguru/utils/round_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'question_area.dart';
import 'info_area.dart';

class QuestionInfoArea extends StatelessWidget {
  final int millis;
  final double height;
  final double width;

  QuestionInfoArea({@required this.millis, @required this.height, @required this.width});

  @override
  Widget build(BuildContext context) {
    final round = Provider.of<RoundProvider>(context);
    final isAnswered = round.isAnswered;

    return AnimatedContainer(
      width: isAnswered ? width * 0.9 : width,
      height: isAnswered ? height : height * 0.8,
      duration: Duration(milliseconds: millis),
      decoration: BoxDecoration(
        color: (isAnswered) ? Colors.white.withOpacity(0.6) : Colors.white.withOpacity(0.3),
        borderRadius: (isAnswered) ? BorderRadius.circular(10) : BorderRadius.circular(0),
      ),
      child: (isAnswered)
          ? InfoArea(question: round.question , millis: millis)
          : QuestionArea(),
    );
  }
}
