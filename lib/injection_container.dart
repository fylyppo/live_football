import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_events.dart';
import 'package:live_football/features/specific_fixture/domain/usecases/get_fixture_lineups.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/util/input_converter.dart';
import 'features/specific_fixture/data/datasources/fixture/fixture_local_data_source.dart';
import 'features/specific_fixture/data/datasources/fixture/fixture_remote_data_source.dart';
import 'features/specific_fixture/data/datasources/fixture_events/fixture_events_remote_data_source.dart';
import 'features/specific_fixture/data/datasources/fixture_lineups/fixture_lineups_remote_data_source.dart';
import 'features/specific_fixture/data/repositories/fixture_events_repository_impl.dart';
import 'features/specific_fixture/data/repositories/fixture_lineups_repository_impl.dart';
import 'features/specific_fixture/data/repositories/fixture_repository_impl.dart';
import 'features/specific_fixture/domain/repositories/fixture_events_repository.dart';
import 'features/specific_fixture/domain/repositories/fixture_repository.dart';
import 'features/specific_fixture/domain/repositories/fixtures_lineups_repository.dart';
import 'features/specific_fixture/domain/usecases/get_fixture.dart';
import 'features/specific_fixture/presentation/bloc/fixture_bloc/fixture_bloc.dart';
import 'features/specific_fixture/presentation/bloc/fixture_events_bloc/fixture_events_bloc.dart';
import 'features/specific_fixture/presentation/bloc/fixture_lineups_bloc/fixture_lineups_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Features - Specific Fixture
  
  // Blocs
  serviceLocator.registerFactory(() => FixtureBloc(
      getFixture: serviceLocator(), inputConverter: serviceLocator()));
  serviceLocator.registerFactory(() => FixtureLineupsBloc(
      getFixtureLineups: serviceLocator()));
  serviceLocator.registerFactory(() => FixtureEventsBloc(
      getFixtureEvents: serviceLocator()));

  // Use cases
  serviceLocator.registerLazySingleton(() => GetFixture(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetFixtureLineups(serviceLocator()));
  serviceLocator.registerLazySingleton(() => GetFixtureEvents(serviceLocator()));

  // Repositories
  serviceLocator.registerLazySingleton<FixtureRepository>(() => FixtureRepositoryImpl(remoteDataSource: serviceLocator(), localDataSource: serviceLocator(), networkInfo: serviceLocator()));
  serviceLocator.registerLazySingleton<FixtureLineupsRepository>(() => FixtureLineupsRepositoryImpl(remoteDataSource: serviceLocator(), networkInfo: serviceLocator()));
  serviceLocator.registerLazySingleton<FixtureEventsRepository>(() => FixtureEventsRepositoryImpl(remoteDataSource: serviceLocator(), networkInfo: serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<FixtureRemoteDataSource>(() => FixtureRemoteDataSourceImpl(client: serviceLocator()));
  serviceLocator.registerLazySingleton<FixtureLocalDataSource>(() => FixtureLocalDataSourceImpl(sharedPrefs: serviceLocator()));

  serviceLocator.registerLazySingleton<FixtureLineupsRemoteDataSource>(() => FixtureLineupsRemoteDataSourceImpl(client: serviceLocator()));
  //serviceLocator.registerLazySingleton<FixtureLineupsLocalDataSource>(() => FixtureLineupsLocalDataSourceImpl(sharedPrefs: serviceLocator()));
  
  serviceLocator.registerLazySingleton<FixtureEventsRemoteDataSource>(() => FixtureEventsRemoteDataSourceImpl(client: serviceLocator()));

  // Core
  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => InputConverter());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => Connectivity());
}
