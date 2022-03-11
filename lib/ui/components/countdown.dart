import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:space_x/model/launch.dart';

class Countdown extends StatelessWidget {
  final Launch launch;

  Countdown(this.launch, {Key? key}) : super(key: key);

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.parse(launch.date_utc).millisecondsSinceEpoch;
    CountdownTimerController controller =
        CountdownTimerController(endTime: endTime, onEnd: onEnd);
    return Center(
      child: CountdownTimer(
        controller: controller,
        onEnd: onEnd,
        endTime: endTime,
        textStyle: TextStyle(
            fontSize: 16,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w600,
            color: Colors.black),
      ),
    );
  }
}
