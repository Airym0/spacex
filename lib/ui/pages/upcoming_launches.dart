import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/ui/components/next_launch.dart';
import 'package:space_x/view_models/home_view_model.dart';

import '../components/launch_list.dart';

class UpcomingLaunches extends StatelessWidget {
  const UpcomingLaunches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, HomeViewModel model, child) {
        return model.upcomingLaunches != null
              ? LaunchList(model.upcomingLaunches ?? [])
              : const Center(
                  child: CircularProgressIndicator(),
                );
    });
  }
}
