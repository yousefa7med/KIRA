sealed class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class ApiFailure extends Failure {
  const ApiFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message);
}
