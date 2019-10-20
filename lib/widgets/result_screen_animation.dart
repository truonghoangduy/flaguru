import 'package:flutter/material.dart';

class ResultScreenAnimation {
  final AnimationController controller;
  Animation<double> titleOpacity;
  Animation<double> resultArea;
  Animation<double> resultButtonArea;
  Animation<double> leaderBoardButton;

  ResultScreenAnimation(this.controller) {
    titleOpacity = Tween(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: controller, curve: Interval(0, 0.2)));
    resultArea = CurvedAnimation(parent: controller, curve: Interval(0.2, 0.5));
    resultButtonArea =
        CurvedAnimation(parent: controller, curve: Interval(0.5, 0.8));
    leaderBoardButton =
        CurvedAnimation(parent: controller, curve: Interval(0.8, 1));
  }
}
