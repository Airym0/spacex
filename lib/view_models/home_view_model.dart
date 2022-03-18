import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/manager/api_manager.dart';
import 'package:space_x/manager/database_manager.dart';
import 'package:space_x/model/company.dart';
import 'package:space_x/model/crew.dart';
import 'package:space_x/model/launch.dart';

@singleton
class HomeViewModel extends ChangeNotifier {

  List<Launch>? upcomingLaunches = [];
  List<Launch>? historyLaunches = [];
  List<Crew>? crews = [];
  int selectedIndex = 0;
  String title = "Upcoming launches";
  Launch? nextLaunch;

  final ScrollController scrollController = ScrollController();

  HomeViewModel(){
    loadUpcomingLauches();
    loadHistoryLaunches();
    loadCrews();
  }

  void onBarButtonItemTapped(int index) {
    selectedIndex = index;
    if(index == 0){
      title = "Upcoming launches";
    } else if(index == 1){
      title ="Past launches";
    } else if(index == 2){
      title ="The Company";
    }
    notifyListeners();
  }

  void setFavorite(Launch launch){
    launch.isFavorite = !launch.isFavorite!;
    DatabaseManager().setLaunchFavorite(
        launch.id, launch.isFavorite ?? false);
    notifyListeners();
  }

  void reload(){
    loadUpcomingLauches();
    notifyListeners();
  }

  Future<Launch?> getLaunchById(String launchId) async {
    return await ApiManager().getOneLaunch(launchId);
  }

  Future<Company?> getCompany() async {
    return await ApiManager().getCompany();
  }

  Future<void> loadCrews() async {
    crews = await ApiManager().getAllCrews();
  }

  Future<void> loadUpcomingLauches() async {
    upcomingLaunches = await ApiManager().getUpcomingLaunches();
    for(Launch launch in upcomingLaunches!){
      launch.isFavorite = await DatabaseManager().isLaunchFavorite(launch.id);
    }
    notifyListeners();
  }

  Future<void> loadHistoryLaunches() async {
    historyLaunches = await ApiManager().getHistoryLaunches();
    for(Launch launch in historyLaunches!){
      launch.isFavorite = await DatabaseManager().isLaunchFavorite(launch.id);
    }
    notifyListeners();
  }



}