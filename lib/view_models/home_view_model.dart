import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/manager/api_manager.dart';
import 'package:space_x/manager/database_manager.dart';
import 'package:space_x/model/company.dart';
import 'package:space_x/model/launch.dart';

@injectable
class HomeViewModel extends ChangeNotifier {

  List<Launch>? upcomingLaunches = [];
  List<Launch>? historyLaunches = [];
  int selectedIndex = 0;
  String title = "Lancements prévus";

  final ScrollController scrollController = ScrollController();

  HomeViewModel(){
    loadUpcomingLauches();
    loadHistoryLaunches();
  }

  void inutile(){
    print('hy');
  }

  void onBarButtonItemTapped(int index) {
    selectedIndex = index;
    if(index == 0){
      title = "Lancements prévus";
    } else if(index == 1){
      title ="Lancements passés";
    } else if(index == 2){
      title ="SpaceX";
    }
    notifyListeners();
  }

  void setFavorite(Launch launch){
    launch.isFavorite = !launch.isFavorite!;
    DatabaseManager().setLaunchFavorite(
        launch.id, launch.isFavorite ?? false);
    notifyListeners();
  }

  Future<Launch?> getLaunchById(String launchId) async {
    return await ApiManager().getOneLaunch(launchId);
  }

  Future<Company?> getCompany() async {
    return await ApiManager().getCompany();
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