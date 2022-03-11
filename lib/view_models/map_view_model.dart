

import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/manager/api_manager.dart';
import 'package:space_x/model/landpad.dart';
import 'package:space_x/model/launchpad.dart';

@injectable
class MapViewModel extends ChangeNotifier {

  List<Launchpad>? launchpads = [];
  List<Landpad>? landpads = [];

  MapViewModel(){
    loadLaunchLandpads();
  }

  Future<void> loadLaunchLandpads() async {
    launchpads = await ApiManager().getAllLaunchpads();
    landpads = await ApiManager().getAllLandpads();
    notifyListeners();
  }



}