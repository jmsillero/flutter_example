/// The classes represent the different exceptions in the case of the demo,
/// we only use couple of errors, in a real app the could has an other else
/// Error handler

abstract class Failure {
  final String message;

  Failure(this.message);
}

// In the case of server send a 403
class UnauthorizedFailure extends Failure {
  UnauthorizedFailure(String message) : super(message);
}

// In the case of server send a 500
class ServerErrorFailure extends Failure {
  ServerErrorFailure(String message) : super(message);
}

// in the case of the server send a 404
class NetworkFailure extends Failure {
  NetworkFailure(String message) : super(message);
}
