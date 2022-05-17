abstract class FixtureComponentRemoteDataSource<Type> {
  Future<Type> getFixtureComponent(int fixtureId);
}