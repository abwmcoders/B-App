import 'package:commerce/src/app/app_prefs.dart';
import 'package:commerce/src/data/data_source/remote_data_source.dart';
import 'package:commerce/src/data/network/app_api.dart';
import 'package:commerce/src/data/network/dio_factory.dart';
import 'package:commerce/src/data/network/network_info.dart';
import 'package:commerce/src/data/repository/repository_impl.dart';
import 'package:commerce/src/domain/repository/repository.dart';
import 'package:commerce/src/domain/use_case/login_use_case.dart';
import 'package:commerce/src/presentation/view/login/login_v_model.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferences(instance()),
  );
  instance.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImplementer(
      InternetConnectionChecker(),
    ),
  );
  instance.registerLazySingleton<DioFactory>(
    () => DioFactory(
      instance(),
    ),
  );
  final dio =  await instance<DioFactory>().getDio();
  instance.registerLazySingleton<AppServiceClient>(
    () => AppServiceClient(
      dio,
    ),
  );
  instance.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceImplementer(
      instance(),
    ),
  );
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      instance(), instance(),
    ),
  );

}


initLoginModule(){
  if(!GetIt.I.isRegistered<LoginUseCase>()){
    instance.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        instance(),
      ),
    );
    instance.registerLazySingleton<LoginViewModel>(
      () => LoginViewModel(
        instance(),
      ),
    );
  }
  
}
