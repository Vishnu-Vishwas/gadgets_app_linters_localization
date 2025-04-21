import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  const Failure(this.errorCode, this.message);
  final int errorCode;
  final String message;

  @override
  List<Object?> get props => throw UnimplementedError();
}

class ServiceFailure extends Failure {
  const ServiceFailure({required String message, required int errorCode})
    : super(errorCode, message);
}

class ClientFailure extends Failure {
  const ClientFailure({required String message, required int errorCode})
    : super(errorCode, message);
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure() : super(-1, "Unexpected Error");
}
