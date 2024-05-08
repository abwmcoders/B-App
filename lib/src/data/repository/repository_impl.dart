import 'package:commerce/src/data/data_source/local_data_source.dart';
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
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  // ignore: unused_field
  final NetworkInfo _networkInfo;

  RepositoryImpl(
      this._networkInfo, this._remoteDataSource, this._localDataSource);

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

  @override
  Future<Either<Failure, ForgotPassword>> forgotPassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    try {
      final response =
          await _remoteDataSource.forgotPassword(forgotPasswordRequest);
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
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest) async {
    try {
      final response = await _remoteDataSource.register(registerRequest);
      if (response.status == ApiInternalStatus.SUCCESS) {
        return Right(
          response.toDomain(),
        );
      } else {
        return Left(
          Failure(
            response.status ?? ApiInternalStatus.FAILURE,
            response.message ?? ResponseMessage.UNKNOWN,
          ),
        );
      }
    } catch (e) {
      return Left(ErrorHandler.handle(e).failure);
    }
  }

  @override
  Future<Either<Failure, Home>> getHome() async {
    try {
      final response = await _localDataSource.getHome();
      return Right(
        response.toDomain(),
      );
    } catch (cachedError) {
      try {
        final response = await _remoteDataSource.getHome();
        if (response.status == ApiInternalStatus.SUCCESS) {
          _localDataSource.saveHomeToCache(response);
          return Right(
            response.toDomain(),
          );
        } else {
          return Left(
            Failure(
              response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.UNKNOWN,
            ),
          );
        }
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }
    }
  }
  
  @override
  Future<Either<Failure, StoreDetails>> getStoreDetails() async{
     try {
      final response = await _localDataSource.getStoreDetails();
      return Right(
        response.toDomain(),
      );
    } catch (cachedError) {
      try {
        final response = await _remoteDataSource.getStoreDetails();
        if (response.status == ApiInternalStatus.SUCCESS) {
          _localDataSource.saveStoreDetailsToCache(response);
          return Right(
            response.toDomain(),
          );
        } else {
          return Left(
            Failure(
              response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.UNKNOWN,
            ),
          );
        }
      } catch (e) {
        return Left(
          ErrorHandler.handle(e).failure,
        );
      }
    }
  }
}
