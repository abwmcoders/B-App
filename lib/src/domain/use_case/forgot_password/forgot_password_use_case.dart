import 'package:commerce/src/data/network/failure.dart';
import 'package:commerce/src/data/request/request.dart';

import 'package:dartz/dartz.dart';

import '../../model/model.dart';
import '../../repository/repository.dart';
import '../use_case.dart';

class ForgotPasswordUseCase
    implements BaseUseCase<ForgotPasswordUseCAseInput, ForgotPassword> {
  final Repository _repository;
  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, ForgotPassword>> execute(
      ForgotPasswordUseCAseInput input) async {
    return await _repository.forgotPassword(
      ForgotPasswordRequest(
        input.email,
      ),
    );
  }
}

class ForgotPasswordUseCAseInput {
  String email;
  ForgotPasswordUseCAseInput(this.email);
}
