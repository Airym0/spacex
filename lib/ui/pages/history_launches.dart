import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_x/view_models/home_view_model.dart';

import '../components/launch_list.dart';

class HistoryLaunches extends StatelessWidget {
  const HistoryLaunches({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
        builder: (context, HomeViewModel model, child) {
          return model.historyLaunches != null
              ? LaunchList(model.historyLaunches ?? [], false)
              : const Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}