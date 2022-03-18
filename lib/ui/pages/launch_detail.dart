import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:space_x/manager/get_it.dart';
import 'package:space_x/model/launch.dart';
import 'package:space_x/ui/components/countdown.dart';
import 'package:space_x/view_models/home_view_model.dart';

import '../components/image_placeholder.dart';

class LaunchDetailArguments {
  Launch launch;

  LaunchDetailArguments({required this.launch});
}

class LaunchDetail extends StatelessWidget {
  static const route = "/launch";

  final Launch launch;

  const LaunchDetail(this.launch, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(launch.name),
      ),
      body:
      FutureBuilder<Launch?>(
        future: locator<HomeViewModel>().getLaunchById(launch.id),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                        child: Image.network(
                          snapshot.data?.links.patch.large ?? '',
                          width: 200,
                          height: 300,
                          errorBuilder: (context, child, stack) {
                            return const SizedBox(
                              height: 12,
                            );
                          },
                        )),
                    Text(
                      snapshot.data?.name ?? '',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text("Flight number : ${snapshot.data?.flight_number}"),
                    const SizedBox(
                      height: 12,
                    ),
                    Text(snapshot.data?.details ?? ''),
                    const SizedBox(
                      height: 12,
                    ),
                    Countdown(launch, () => {
                      print("end")
                    }),
                  ],
                ),
              )
            );
          }
          else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}