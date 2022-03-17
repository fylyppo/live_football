import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/platform/network_info.dart';
import 'package:live_football/features/live_matches/data/datasources/live_matches_local_data_source.dart';
import 'package:live_football/features/live_matches/data/datasources/live_matches_remote_data_source.dart';
import 'package:live_football/features/live_matches/data/repositories/live_matches_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements LiveMatchesRemoteDataSource {

}

class MockLocalDataSource extends Mock implements LiveMatchesLocalDataSource {
  
}

class MockNetworkInfo extends Mock implements NetworkInfo {

}

void main() {
  LiveMatchesRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = LiveMatchesRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}