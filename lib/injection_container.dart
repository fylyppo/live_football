import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'core/util/input_converter.dart';
import 'features/specific_fixture/data/datasources/fixture/fixture_local_data_source.dart';
import 'features/specific_fixture/data/datasources/fixture/fixture_remote_data_source.dart';
import 'features/specific_fixture/data/repositories/fixture_repository_impl.dart';
import 'features/specific_fixture/domain/repositories/fixture_repository.dart';
import 'features/specific_fixture/domain/usecases/get_fixture.dart';
import 'features/specific_fixture/presentation/bloc/fixture_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Features - Fixture
  // Bloc
  serviceLocator.registerFactory(() => FixtureBloc(
      getFixture: serviceLocator(), inputConverter: serviceLocator()));

  // Use cases
  serviceLocator.registerLazySingleton(() => GetFixture(serviceLocator()));

  // Repository
  serviceLocator.registerLazySingleton<FixtureRepository>(() => FixtureRepositoryImpl(remoteDataSource: serviceLocator(), localDataSource: serviceLocator(), networkInfo: serviceLocator()));

  // Data sources
  serviceLocator.registerLazySingleton<FixtureRemoteDataSource>(() => FixtureRemoteDataSourceImpl(client: serviceLocator()));

  serviceLocator.registerLazySingleton<FixtureLocalDataSource>(() => FixtureLocalDataSourceImpl(sharedPrefs: serviceLocator()));
  
  // Core
  serviceLocator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(serviceLocator()));
  serviceLocator.registerLazySingleton(() => InputConverter());

  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton(() => sharedPreferences);
  serviceLocator.registerLazySingleton(() => http.Client());
  serviceLocator.registerLazySingleton(() => Connectivity());
}
