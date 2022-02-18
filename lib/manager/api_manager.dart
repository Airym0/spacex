import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/model/launch.dart';

@singleton
class ApiManager {

  Dio dio = Dio();

  ApiManager(){
    dio.options.baseUrl="https://api.spacexdata.com/v4";
  }

  List<Launch>? parseLaunches(List<dynamic>? jsonArray){
    //immediatly return null if json is null
    if(jsonArray == null) return null;
    return jsonArray.map<Launch>((json) => Launch.fromJson(json)).toList();
  }

  Launch? parseOneLaunch(Map<String, dynamic>? json){
    //immediatly return null if json is null
    if(json == null) return null;
    return Launch.fromJson(json);
  }

  Future<List<Launch>?> getUpcomingLaunches() async {
    try{
      List<Launch>? launches = await dio
          .get<List<dynamic>>("/launches/upcoming")
          .then((response) => parseLaunches(response.data));
      return launches;
    } catch(error) {
      debugPrint("Erreur : $error");
      return null;
    }
  }

  Future<List<Launch>?> getHistoryLaunches() async {
    try{
      List<Launch>? launches = await dio
          .get<List<dynamic>>("/launches/past")
          .then((response) => parseLaunches(response.data));
      return launches;
    } catch(error) {
      debugPrint("Erreur : $error");
      return null;
    }
  }

  Future<Launch?> getOneLaunch(String launchId) async {
    try{
      Launch? launch = await dio
          .get<Map<String, dynamic>>("/launches/$launchId")
          .then((response) => parseOneLaunch(response.data));
      return launch;
    } catch(error) {
      debugPrint("Erreur : $error");
      return null;
    }
  }

}