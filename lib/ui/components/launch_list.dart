import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x/manager/database_manager.dart';
import 'package:space_x/model/launch.dart';
import 'package:space_x/ui/pages/launch_detail.dart';
import 'package:space_x/view_models/home_view_model.dart';

class LaunchList extends StatelessWidget {
  final List<Launch> launches;

  const LaunchList(this.launches, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, HomeViewModel model, child) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, position) {
            Launch launch = launches[position];
            return InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(LaunchDetail.route,
                    arguments: LaunchDetailArguments(launch: launch));
              },
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          launch.name,
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("N° de vol : ${launch.flight_number}"),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Date : ${launch.date_utc}")
                      ],
                    ),
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        model.setFavorite(launch);
                      },
                      icon: Icon(
                        launch.isFavorite! ? Icons.thumb_up : Icons
                            .thumb_up_outlined,
                      ),
                      label: const Text("")
                  )
                ],
              ),
            );
          },
          itemCount: launches.length,
        );
      }
    );
  }

}