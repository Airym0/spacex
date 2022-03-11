import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:space_x/model/launch.dart';
import 'package:space_x/ui/pages/launch_detail.dart';
import 'package:space_x/view_models/home_view_model.dart';

import 'countdown.dart';

class NextLaunch extends StatelessWidget {
  final Launch launch;

  NextLaunch(this.launch, {Key? key}) : super(key: key);

  void onEnd() {
    print('onEnd');
  }

  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.parse(launch.date_utc).millisecondsSinceEpoch;
    CountdownTimerController controller =
        CountdownTimerController(endTime: endTime, onEnd: onEnd);
    return ChangeNotifierProvider(
        create: (context) => HomeViewModel(),
        child: Consumer<HomeViewModel>(
            builder: (context, HomeViewModel model, child) {
          return InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(LaunchDetail.route,
                  arguments: LaunchDetailArguments(launch: launch));
            },
            child: Container(
              color: Color.fromRGBO(79, 144, 255, 0.2),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Countdown(launch),
                          Text(
                            launch.name,
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text("N° de vol : ${launch.flight_number}"),
                          const SizedBox(
                            height: 8,
                          ),

                          Text("Date : ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(launch.date_utc))}")
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          model.setFavorite(launch);
                        },
                        icon: Icon(
                          launch.isFavorite!
                              ? Icons.thumb_up
                              : Icons.thumb_up_outlined,
                        ),
                        label: const Text(""))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
