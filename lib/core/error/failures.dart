import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  Failure() : super();
}

// General failures
class ServerFailure extends Failure {
  @override
  List<Object> get props => [];
}

class CacheFailure extends Failure {
  @override
  List<Object> get props => [];
}

class NetworkFailure extends Failure {
  @override
  List<Object> get props => [];
}

class Unauthorized extends Failure {
  @override
  List<Object> get props => [];
}
