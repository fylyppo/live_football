import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:live_football/core/error/exceptions.dart';
import 'package:live_football/core/error/failures.dart';
import 'package:live_football/core/network/network_info.dart';
import 'package:live_football/features/specific_fixture/data/datasources/fixture_lineups/fixture_lineups_remote_data_source.dart';
import 'package:live_football/features/specific_fixture/data/models/lineups_model.dart';
import 'package:live_football/features/specific_fixture/data/repositories/fixture_lineups_repository_impl.dart';
import 'package:live_football/features/specific_fixture/domain/entities/lineups.dart';
import 'package:live_football/features/specific_fixture/domain/entities/team.dart';
import 'package:mocktail/mocktail.dart';

class MockRemoteDataSource extends Mock implements FixtureLineupsRemoteDataSource {}

// class MockLocalDataSource extends Mock implements LiveMatchesLocalDataSource {
  
// }

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late FixtureLineupsRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;
  //late MockLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    //mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = FixtureLineupsRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      //localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
  
  group('getConcreteFixtureLineups', () {
    const tFixtureId = 1;
    var tFixtureLineupsModel = LineupsModel(homeLineup: Lineup(
          team: Team(
              id: 50,
              name: 'Manchester City',
              logo: 'https://media.api-sports.io/football/teams/50.png'),
          formation: "4-3-3",
          startXI: const Players(playersList: [
            Player(id: 617, name: "Ederson", number: 31, pos: "G", grid: "1:1"),
            Player(
                id: 627, name: "Kyle Walker", number: 2, pos: "D", grid: "2:4")
          ]),
          substitutes: const Players(playersList: [
            Player(
                id: 50828,
                name: "Zack Steffen",
                number: 13,
                pos: "G",
                grid: null),
            Player(
                id: 623,
                name: "Benjamin Mendy",
                number: 22,
                pos: "D",
                grid: null)
          ]),
          coach: const Coach(
              id: 4,
              name: "Guardiola",
              photo: "https://media.api-sports.io/football/coachs/4.png")), awayLineup: Lineup(
          team: Team(
              id: 45,
              name: "Everton",
              logo: "https://media.api-sports.io/football/teams/45.png"),
          formation: "4-3-1-2",
          startXI: const Players(playersList: [
            Player(
                id: 2932,
                name: "Jordan Pickford",
                number: 1,
                pos: "G",
                grid: "1:1"),
            Player(
                id: 19150,
                name: "Mason Holgate",
                number: 4,
                pos: "D",
                grid: "2:4")
          ]),
          substitutes: const Players(playersList: [
            Player(
                id: 18755,
                name: "João Virgínia",
                number: 31,
                pos: "G",
                grid: null)
          ]),
          coach: const Coach(
              id: 2407,
              name: "C. Ancelotti",
              photo: "https://media.api-sports.io/football/coachs/2407.png")));
    
    test('check if the device is online', () async {
    //arrange
    when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    //act
    repository.getFixtureLineups(tFixtureId);
    //assert
    verify(() => mockNetworkInfo.isConnected);
    });

    group('device is online', () {
      setUp(() {
        when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data when the call to remote data source is successful', () async {
        //arrange
        when(() => mockRemoteDataSource.getFixtureLineups(any())).thenAnswer((_) async => tFixtureLineupsModel);
        //act
        final result = await repository.getFixtureLineups(tFixtureId);
        //assert
        verify(() => mockRemoteDataSource.getFixtureLineups(tFixtureId));
        expect(result, equals(Right(tFixtureLineupsModel)));
      });

      //       test('should cache the data locally when the call to remote data source is successful', () async {
      //   //arrange
      //   when(() => mockRemoteDataSource.getFixtureLineups(any())).thenAnswer((_) async => tFixtureLineupsModel);
      //   //act
      //   await repository.getFixtureLineups(tFixtureId);
      //   //assert
      //   verify(() => mockRemoteDataSource.getFixtureLineups(tFixtureId));
      //   verify(() => mockLocalDataSource.cacheLiveMatches(tFixtureLineupsModel),);
      // });

            test('should return server failure when the call to remote data source is unsuccessful', () async {
        //arrange
        when(() => mockRemoteDataSource.getFixtureLineups(any())).thenThrow(ServerException());
        //act
        final result = await repository.getFixtureLineups(tFixtureId);
        //assert
        verify(() => mockRemoteDataSource.getFixtureLineups(tFixtureId));
        //verifyZeroInteractions(mockLocalDataSource);
        expect(result, equals(Left(ServerFailure())));
      });
    });

    //     group('device is offline', () {
    //   setUp(() {
    //     when(() => mockNetworkInfo.isConnected).thenAnswer((_) async => false);
    //   });
    //   test('should return last locally cached data when the cached data is present', () async {
    //     //arrange
    //     when(() => mockLocalDataSource.getLastFixtureLineups()).thenAnswer((_) async => tFixtureLineupsModel);
    //     //act
    //     final result = await repository.getFixtureLineups(tFixtureId);
    //     //assert
    //     verifyZeroInteractions(mockRemoteDataSource);
    //     verify(() => mockLocalDataSource.getLastFixtureLineups());
    //     expect(result, equals(const Right(tFixtureLineupsModel)));
    //   });

    //   test('should return CacheFailure when there is no cached data present', () async {
    //     //arrange
    //     when(() => mockLocalDataSource.getLastFixtureLineups()).thenThrow(CacheException());
    //     //act
    //     final result = await repository.getFixtureLineups(tFixtureId);
    //     //assert
    //     verifyZeroInteractions(mockRemoteDataSource);
    //     verify(() => mockLocalDataSource.getLastFixtureLineups());
    //     expect(result, equals(Left(CacheFailure())));
    //   });
    // });
  });
}