import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/platform/network_info.dart';
import 'package:live_football/features/live_matches/data/datasources/live_matches_local_data_source.dart';
import 'package:live_football/features/live_matches/data/datasources/live_matches_remote_data_source.dart';
import 'package:live_football/features/live_matches/data/models/live_matches_model.dart';
import 'package:live_football/features/live_matches/data/repositories/live_matches_repository_impl.dart';
import 'package:live_football/features/live_matches/domain/entities/live_matches.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements LiveMatchesRemoteDataSource {

}

class MockLocalDataSource extends Mock implements LiveMatchesLocalDataSource {
  
}

class MockNetworkInfo extends Mock implements NetworkInfo {

}

void main() {
  late LiveMatchesRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

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

  group('getConcreteLiveMatches', () {
    const tleague = 'Premier League';
    const tLiveMatchesModel = LiveMatchesModel(matches: [Match(fixture: Fixture(id: 1, referee: 'Piputkin'))]);
    const LiveMatches tLiveMatches = tLiveMatchesModel;
    
    test('check if the device is online', () async {
    //arrange
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    //act
    repository.getLiveMatches(tleague);
    //assert
    verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when the call to remote data source is successful', () async {
        //arrange
        when(() => mockRemoteDataSource.getLiveMatches(any())).thenAnswer((_) async => tLiveMatchesModel);
        //act
        final result = await repository.getLiveMatches(tleague);
        //assert
        verify(() => mockRemoteDataSource.getLiveMatches(tleague));
        expect(result, equals(const Right(tLiveMatches)));
      });

            test('should cache the data locally when the call to remote data source is successful', () async {
        //arrange
        when(() => mockRemoteDataSource.getLiveMatches(any())).thenAnswer((_) async => tLiveMatchesModel);
        //act
        await repository.getLiveMatches(tleague);
        //assert
        verify(() => mockRemoteDataSource.getLiveMatches(tleague));
        verify(() => mockLocalDataSource.cacheLiveMatches(tLiveMatchesModel),);
      });
    });

        group('device is offline', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
    });
  });
}