import 'dart:convert';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/features/specific_fixture/data/models/fixture_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class FixtureLocalDataSource {
  Future<FixtureModel> getLastFixture();
  Future<bool>? cacheFixture(FixtureModel? matchesToCache);
}

const CACHED_FIXTURE = 'CACHED_FIXTURE';

class FixtureLocalDataSourceImpl implements FixtureLocalDataSource {
  late SharedPreferences sharedPrefs;

  FixtureLocalDataSourceImpl({required this.sharedPrefs});
  
    @override
  Future<FixtureModel> getLastFixture() {
    final jsonString = sharedPrefs.getString(CACHED_FIXTURE);
    if(jsonString != null){
      return Future.value(FixtureModel.fromJson(json.decode(jsonString)));
    } else {
      throw CacheException();
    }
  }
  
  @override
  Future<bool>? cacheFixture(FixtureModel? fixtureToCache) async {
    sharedPrefs = await SharedPreferences.getInstance();
    return await sharedPrefs.setString(CACHED_FIXTURE, json.encode(fixtureToCache!.toJson()));
  }
}