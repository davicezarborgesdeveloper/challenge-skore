import 'package:dartz/dartz.dart';
import 'package:skore/data/failure.dart';
import 'package:skore/data/responses/responses.dart';

abstract class Repository {
  Future<Either<Failure, HomeResponse>> getHome();
}
