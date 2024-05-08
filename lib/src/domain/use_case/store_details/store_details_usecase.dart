import 'package:dartz/dartz.dart';

import '../../../data/network/failure.dart';
import '../../model/model.dart';
import '../../repository/repository.dart';
import '../use_case.dart';

class StoreDetailsUseCase extends BaseUseCase<void, StoreDetails> {
  final Repository _repository;
  StoreDetailsUseCase(this._repository);
  @override
  Future<Either<Failure, StoreDetails>> execute(void input) async {
    return await _repository.getStoreDetails();
  }
}
