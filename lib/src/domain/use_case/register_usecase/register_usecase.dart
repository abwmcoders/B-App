import 'package:commerce/src/data/network/failure.dart';
import 'package:commerce/src/data/request/request.dart';
import 'package:commerce/src/domain/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

import '../../model/model.dart';
import '../../repository/repository.dart';

class RegisterUseCase
    implements BaseUseCase<RegisterUseCaseInput, Authentication> {
//
  final Repository _repository;

  RegisterUseCase(this._repository);
  //
  @override
  Future<Either<Failure, Authentication>> execute(
      RegisterUseCaseInput input) async {
    return await _repository.register(
      RegisterRequest(
        input.countryMobileCode,
        input.username,
        input.email,
        input.password,
        input.mobileNumber,
        input.profilePix,
      ),
    );
  }
}

class RegisterUseCaseInput {
  String countryMobileCode;
  String username;
  String email;
  String password;
  String mobileNumber;
  String profilePix;

  RegisterUseCaseInput(
    this.countryMobileCode,
    this.username,
    this.email,
    this.password,
    this.mobileNumber,
    this.profilePix,
  );
}
