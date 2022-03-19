import 'dart:convert';

import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/live_matches/data/models/live_matches_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/live_matches.dart';

abstract class LiveMatchesLocalDataSource {
  Future<LiveMatchesModel> getLastLiveMatches();
  Future<bool>? cacheLiveMatches(LiveMatchesModel? matchesToCache);
}

const CACHED_LIVE_MATCHES = 'CACHED_LIVE_MATCHES';

class LiveMatchesLocalDataSourceImpl implements LiveMatchesLocalDataSource {
  //final SharedPreferences sharedPreferences;
  late SharedPreferences sharedPrefs;

  LiveMatchesLocalDataSourceImpl({required this.sharedPrefs});
  
    @override
  Future<LiveMatchesModel> getLastLiveMatches() {
    //sharedPrefs = SharedPreferences.getInstance();
    //final SharedPreferences sharedPreferences = await sharedPrefs;
    final jsonString = sharedPrefs.getString(CACHED_LIVE_MATCHES);
    if(jsonString != null){
      return Future.value(LiveMatchesModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
  
  @override
  Future<bool>? cacheLiveMatches(LiveMatchesModel? matchesToCache) async {
    sharedPrefs = await SharedPreferences.getInstance();
    //final SharedPreferences sharedPreferences = await sharedPrefs;
    return await sharedPrefs.setString(CACHED_LIVE_MATCHES, json.encode(matchesToCache!.toJson()));
  }
}