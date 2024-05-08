import 'package:commerce/src/data/network/failure.dart';
import 'package:commerce/src/domain/model/model.dart';
import 'package:commerce/src/domain/repository/repository.dart';
import 'package:commerce/src/domain/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class HomeUseCase extends BaseUseCase<void, Home> {
  final Repository _repository;
  HomeUseCase(this._repository);
  @override
  Future<Either<Failure, Home>> execute(void input) async {
    return await _repository.getHome();
  }
}
