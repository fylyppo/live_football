import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final List properties = const<dynamic>[];
  const Failure([properties]);
  @override
  List<Object?> get props => [properties];
}

// Genereal failures
class ServerFailure extends Failure {}
class CacheFailure extends Failure {}