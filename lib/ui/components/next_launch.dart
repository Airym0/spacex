import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:space_x/manager/get_it.dart';
import 'package:space_x/manager/notification_manager.dart';
import 'package:space_x/model/launch.dart';
import 'package:space_x/ui/pages/launch_detail.dart';
import 'package:space_x/view_models/home_view_model.dart';

import 'countdown.dart';
import 'image_placeholder.dart';

class NextLaunch extends StatelessWidget {
  final Launch launch;

  NextLaunch(this.launch, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, HomeViewModel model, child) {
      return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(LaunchDetail.route,
              arguments: LaunchDetailArguments(launch: launch));
        },
        child: Container(
          color: Color.fromRGBO(79, 144, 255, 0.2),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                    width: 75,
                    height: 75,
                    child: Image.network(
                      launch.links.patch.small ?? '',
                      errorBuilder: (context, child, stack) {
                        return const ImagePlaceholder();
                      },
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Countdown(
                            launch,
                            () => {
                                  if (NotificationManager.activated)
                                    {
                                      NotificationManager.showNotification(
                                          title: "Space X launch",
                                          body: "${launch.name} is taking of !",
                                          payload: "payload"),
                                      model.reload()
                                    }
                                }),
                      ),
                      Text(
                        launch.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text("Flight number : ${launch.flight_number}"),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                          "Date : ${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(launch.date_utc))}")
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: ElevatedButton.icon(
                    onPressed: () {
                      model.setFavorite(launch);
                    },
                    icon: Icon(
                      launch.isFavorite!
                          ? Icons.thumb_up
                          : Icons.thumb_up_outlined,
                    ),
                    label: const Text('')),
              ),
            ],
          ),
        ),
      );
    });
  }
}
