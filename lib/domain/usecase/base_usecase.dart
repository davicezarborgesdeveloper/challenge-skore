import 'package:dartz/dartz.dart';
import 'package:skore/data/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}
