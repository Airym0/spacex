import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:space_x/manager/database_manager.dart';
import 'package:space_x/model/launch.dart';
import 'package:space_x/ui/components/next_launch.dart';
import 'package:space_x/ui/pages/launch_detail.dart';
import 'package:space_x/view_models/home_view_model.dart';

class LaunchList extends StatelessWidget {
  final List<Launch> launches;
  final bool upcomings;

  const LaunchList(this.launches, this.upcomings, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, HomeViewModel model, child) {
        return ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemBuilder: (context, position) {
            Launch launch = launches[position];
            if(position == 0 && upcomings){
              return NextLaunch(launch);
            } else {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(LaunchDetail.route,
                      arguments: LaunchDetailArguments(launch: launch));
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
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
                            launch.isFavorite! ? Icons.thumb_up : Icons
                                .thumb_up_outlined,
                          ),
                          label: const Text("")
                      )
                    ],
                  ),
                ),
              );
            }
          },
          itemCount: launches.length,
        );
      }
    );
  }

}