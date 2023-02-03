abstract class Failure {
  //@override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class DatabaseFailure extends Failure {}
