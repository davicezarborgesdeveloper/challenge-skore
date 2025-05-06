import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:skore/data/data_source/local_data_source.dart';
import 'package:skore/data/failure.dart';
import 'package:skore/data/responses/responses.dart';
import 'package:skore/domain/repository/repository.dart';

class RepositoryImpl implements Repository {
  final LocalDataSource _localDataSource;
  RepositoryImpl(this._localDataSource);
  @override
  Future<Either<Failure, HomeResponse>> getHome() async {
    try {
      final response = await _localDataSource.getHome();
      return Right(response);
    } catch (error, s) {
      log('Erro', error: error, stackTrace: s);
      return Left(Failure(-1, 'Erro'));
    }
  }
}
