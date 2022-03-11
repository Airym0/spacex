import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:space_x/model/company.dart';
import 'package:space_x/model/landpad.dart';
import 'package:space_x/model/launch.dart';
import 'package:space_x/model/launchpad.dart';

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

  List<Launchpad>? parseLaunchpads(List<dynamic>? jsonArray){
    //immediatly return null if json is null
    if(jsonArray == null) return null;
    return jsonArray.map<Launchpad>((json) => Launchpad.fromJson(json)).toList();
  }

  Launchpad? parseOneLaunchpad(Map<String, dynamic>? json){
    //immediatly return null if json is null
    if(json == null) return null;
    return Launchpad.fromJson(json);
  }

  List<Landpad>? parseLandpads(List<dynamic>? jsonArray){
    //immediatly return null if json is null
    if(jsonArray == null) return null;
    return jsonArray.map<Landpad>((json) => Landpad.fromJson(json)).toList();
  }

  Landpad? parseOneLandpad(Map<String, dynamic>? json){
    //immediatly return null if json is null
    if(json == null) return null;
    return Landpad.fromJson(json);
  }

  Company? parseCompany(Map<String, dynamic>? json){
    //immediatly return null if json is null
    if(json == null) return null;
    return Company.fromJson(json);
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

  Future<List<Launchpad>?> getAllLaunchpads() async {
    try{
      List<Launchpad>? launchpads = await dio
          .get<List<dynamic>>("/launchpads")
          .then((response) => parseLaunchpads(response.data));
      return launchpads;
    } catch(error) {
      debugPrint("Erreur : $error");
      return null;
    }
  }

  Future<List<Landpad>?> getAllLandpads() async {
    try{
      List<Landpad>? landpads = await dio
          .get<List<dynamic>>("/landpads")
          .then((response) => parseLandpads(response.data));
      return landpads;
    } catch(error) {
      debugPrint("Erreur : $error");
      return null;
    }
  }

  Future<Company?> getCompany() async {
    try{
      Company? company = await dio
          .get<Map<String, dynamic>>("/company")
          .then((response) => parseCompany(response.data));
      return company;
    } catch(error) {
      debugPrint("Erreur : $error");
      return null;
    }
  }

}