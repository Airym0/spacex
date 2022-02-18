import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class DatabaseManager {

  void setLaunchFavorite(String launchId, bool isFavorite) async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    await sharedPreferences.setBool("launch_$launchId", isFavorite);
  }

  Future<bool> isLaunchFavorite(String launchId) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? result = sharedPreferences.getBool("launch_$launchId");
    if(result != null){
      return result;
    }
    return false;
  }
}