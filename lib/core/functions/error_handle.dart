import 'package:aurastate/core/errors/failure.dart';
import 'package:aurastate/core/errors/failure_code.dart';

Failure handleError(Object e) {
  if (e is AppFailure) {
    return e;
  }

  return AppFailure(failureCode: FailureCode.unknown, message: e.toString());
}
