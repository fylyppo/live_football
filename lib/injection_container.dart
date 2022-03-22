import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/live_matches/data/datasources/live_matches_remote_data_source.dart';
import 'package:live_football/features/live_matches/data/repositories/live_matches_repository_impl.dart';
import 'package:live_football/features/live_matches/domain/repositories/live_matches_repository.dart';
import 'package:live_football/features/live_matches/domain/usecases/get_live_matches.dart';
import 'package:live_football/features/live_matches/presentation/bloc/live_matches_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/util/input_converter.dart';
import 'features/live_matches/data/datasources/live_matches_local_data_source.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Features - LiveMatches
  // Bloc
  serviceLocator.registerFactory(() => LiveMatchesBloc(
      getLiveMatches: serviceLocator(), inputConverter: serviceLocator()));

  // Use cases
  serviceLocator.registerLazySingleton(() => GetLiveMatches(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<LiveMatchesRepository>(() => LiveMatchesRepositoryImpl(remoteDataSource: serviceLocator(), localDataSource: serviceLocator(), networkInfo: serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<LiveMatchesRemoteDataSource>(() => LiveMatchesRemoteDataSourceImpl(client: serviceLocator()));

  serviceLocator.registerLazySingleton<LiveMatchesLocalDataSource>(() => LiveMatchesLocalDataSourceImpl(sharedPrefs: serviceLocator()));
  
  // Core
  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => InputConverter());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => Connectivity());
}
