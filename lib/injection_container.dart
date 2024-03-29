import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:live_football/core/datasources/remote/api_football_client.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/fixtures/domain/usecases/get_fixtures.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_events.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_lineups.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/utils/input_converter.dart';
import 'features/fixtures/data/datasources/fixtures/fixtures_remote_data_source.dart';
import 'features/fixtures/data/repositories/fixtures_repository_impl.dart';
import 'features/fixtures/domain/repositories/fixtures_repository.dart';
import 'features/fixtures/presentation/blocs/bloc/fixtures_bloc.dart';
import 'features/specific_fixture/data/datasources/fixture_component_remote_data_source.dart';
import 'features/specific_fixture/data/datasources/impl/fixture/fixture_local_data_source.dart';
import 'features/specific_fixture/data/datasources/impl/fixture/fixture_remote_data_source.dart';
import 'features/specific_fixture/data/datasources/impl/fixture_events/fixture_events_remote_data_source.dart';
import 'features/specific_fixture/data/datasources/impl/fixture_lineups/fixture_lineups_remote_data_source.dart';
import 'features/specific_fixture/data/datasources/impl/fixture_stats/fixture_stats_remote_data_source.dart';
import 'features/specific_fixture/data/repositories/fixture_events_repository_impl.dart';
import 'features/specific_fixture/data/repositories/fixture_lineups_repository_impl.dart';
import 'features/specific_fixture/data/repositories/fixture_repository_impl.dart';
import 'features/specific_fixture/data/repositories/fixture_stats_repository_impl.dart';
import 'features/specific_fixture/domain/repositories/fixture_repository.dart';
import 'features/specific_fixture/domain/usecases/get_fixture.dart';
import 'features/specific_fixture/domain/usecases/get_fixture_stats.dart';
import 'features/specific_fixture/presentation/blocs/fixture_bloc/fixture_bloc.dart';
import 'features/specific_fixture/presentation/blocs/fixture_events_bloc/fixture_events_bloc.dart';
import 'features/specific_fixture/presentation/blocs/fixture_lineups_bloc/fixture_lineups_bloc.dart';
import 'features/specific_fixture/presentation/blocs/fixture_stats_bloc/fixture_stats_bloc.dart';
import 'package:dio/dio.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Feature - Specific Fixture
  
  // Blocs
  serviceLocator.registerFactory(() => FixtureBloc(
      getFixture: serviceLocator(), inputConverter: serviceLocator()));
  serviceLocator.registerFactory(() => FixtureLineupsBloc(
      getFixtureLineups: serviceLocator()));
  serviceLocator.registerFactory(() => FixtureEventsBloc(
      getFixtureEvents: serviceLocator()));
  serviceLocator.registerFactory(() => FixtureStatsBloc(getFixtureStats: serviceLocator()));

  // Use cases
  serviceLocator.registerLazySingleton(() => GetFixture(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetFixtureLineups(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetFixtureEvents(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetFixtureStats(serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton(() => FixtureRepositoryImpl(remoteDataSource: serviceLocator(), localDataSource: serviceLocator(), networkInfo: serviceLocator()));


  serviceLocator.registerLazySingleton(() => FixtureLineupsRepositoryImpl(remoteDataSource: serviceLocator(), networkInfo: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FixtureEventsRepositoryImpl(remoteDataSource: serviceLocator(), networkInfo: serviceLocator()));
  serviceLocator.registerLazySingleton(() => FixtureStatsRepositoryImpl(remoteDataSource: serviceLocator(), networkInfo: serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<FixtureRemoteDataSource>(() => FixtureRemoteDataSourceImpl(client: serviceLocator(), dio: serviceLocator()));
  serviceLocator.registerLazySingleton<FixtureLocalDataSource>(() => FixtureLocalDataSourceImpl(sharedPrefs: serviceLocator()));

  serviceLocator.registerLazySingleton(() => FixtureLineupsRemoteDataSourceImpl(client: serviceLocator(), dio: serviceLocator()));
  //serviceLocator.registerLazySingleton<FixtureLineupsLocalDataSource>(() => FixtureLineupsLocalDataSourceImpl(sharedPrefs: serviceLocator()));
  
  serviceLocator.registerLazySingleton(() => FixtureEventsRemoteDataSourceImpl(client: serviceLocator(), dio: serviceLocator()));

  serviceLocator.registerLazySingleton(() => FixtureStatsRemoteDataSourceImpl(client: serviceLocator(), dio: serviceLocator()));

  
  // Feature - Fixtures
  
  // Blocs
  serviceLocator.registerFactory(() => FixturesBloc(getFixtures: serviceLocator()));

  // Use cases
  serviceLocator.registerLazySingleton(() => GetFixtures(serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<FixturesRepository>(() => FixturesRepositoryImpl(remoteDataSource: serviceLocator(), networkInfo: serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<FixturesRemoteDataSource>(() => FixturesRemoteDataSourceImpl(client: serviceLocator(), dio: serviceLocator()));

  // Core
  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => InputConverter());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = Dio();
  dio.options.headers['x-apisports-key'] = '****';
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => dio);
  serviceLocator.registerLazySingleton(() => ApiFootballClient(serviceLocator()));
  serviceLocator.registerLazySingleton(() => Connectivity());
}