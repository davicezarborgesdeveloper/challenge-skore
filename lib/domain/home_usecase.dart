import 'package:dartz/dartz.dart';
import 'package:skore/data/failure.dart';
import 'package:skore/data/responses/responses.dart';
import 'package:skore/domain/repository/repository.dart';
import 'package:skore/domain/usecase/base_usecase.dart';

class HomeUseCase extends BaseUseCase<void, Object> {
  final Repository _repository;
  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeResponse>> execute(void input) async {
    return await _repository.getHome();
  }
}
