import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:space_x/model/launch.dart';

class Countdown extends StatelessWidget {
  final Launch launch;
  final void Function() onEnd;

  Countdown(this.launch, this.onEnd, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.parse(launch.date_utc).millisecondsSinceEpoch;
    CountdownTimerController controller =
        CountdownTimerController(endTime: endTime, onEnd: onEnd);
    return Center(
      child: DateTime.parse(launch.date_utc).isAfter(DateTime.now()) ? CountdownTimer(
        controller: controller,
        onEnd: onEnd,
        endTime: endTime,
        textStyle: const TextStyle(
            fontSize: 18,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            color: Colors.blue),
      ) : const SizedBox()
    );
  }
}
