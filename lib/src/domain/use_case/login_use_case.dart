import 'dart:developer';

import 'package:commerce/src/app/functions.dart';
import 'package:commerce/src/data/network/failure.dart';
import 'package:commerce/src/data/request/request.dart';
import 'package:commerce/src/domain/model/model.dart';
import 'package:commerce/src/domain/repository/repository.dart';
import 'package:commerce/src/domain/use_case/use_case.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Authentication>> execute(
    
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();
    return await _repository.login(
      LoginRequest(
        input.email,
        input.password,
        deviceInfo.identifier,
        deviceInfo.name,
      ),
    );
  }
}

class LoginUseCaseInput {
  String email;
  String password;

  LoginUseCaseInput(
    this.email,
    this.password,
  );
}
