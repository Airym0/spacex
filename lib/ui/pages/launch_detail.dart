import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:space_x/model/launch.dart';
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
        future: HomeViewModel().getLaunchById(launch.id),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      snapshot.data?.name ?? '',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Text("N° de vol : ${snapshot.data?.flight_number}"),
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