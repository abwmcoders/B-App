import 'dart:developer';

import 'package:commerce/src/data/data_source/remote_data_source.dart';
import 'package:commerce/src/data/mappers/mapper.dart';
import 'package:commerce/src/data/network/error_handler.dart';
import 'package:commerce/src/data/network/failure.dart';
import 'package:commerce/src/data/network/network_info.dart';
import 'package:commerce/src/data/request/request.dart';
import 'package:commerce/src/domain/model/model.dart';
import 'package:commerce/src/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;
  RepositoryImpl(this._networkInfo, this._remoteDataSource);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    // if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          return Right(
            response.toDomain(),
          );
        } else {
          return Left(
            Failure(response.status ?? ApiInternalStatus.FAILURE,
                response.message ?? ResponseMessage.UNKNOWN),
          );
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    //} else {
      // return Left(
      //   Failure(ResponseCode.NO_INTERNET_CONNECTION, ResponseMessage.NO_INTERNET_CONNECTION),
      // );
    //   return Left(
    //     DataSource.NO_INTERNET_CONNECTION.getFailure(),
    //   );
    // }
  }
}
