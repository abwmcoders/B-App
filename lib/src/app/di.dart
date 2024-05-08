import 'package:commerce/src/app/app_prefs.dart';
import 'package:commerce/src/data/data_source/local_data_source.dart';
import 'package:commerce/src/data/data_source/remote_data_source.dart';
import 'package:commerce/src/data/network/app_api.dart';
import 'package:commerce/src/data/network/dio_factory.dart';
import 'package:commerce/src/data/network/network_info.dart';
import 'package:commerce/src/data/repository/repository_impl.dart';
import 'package:commerce/src/domain/repository/repository.dart';
import 'package:commerce/src/domain/use_case/forgot_password/forgot_password_use_case.dart';
import 'package:commerce/src/domain/use_case/home_usecase/home_usecase.dart';
import 'package:commerce/src/domain/use_case/login/login_use_case.dart';
import 'package:commerce/src/domain/use_case/register_usecase/register_usecase.dart';
import 'package:commerce/src/domain/use_case/store_details/store_details_usecase.dart';
import 'package:commerce/src/presentation/view/forget_password/forget_password_viewmodel.dart';
import 'package:commerce/src/presentation/view/login/login_v_model.dart';
import 'package:commerce/src/presentation/view/main/home/home_viewmodel.dart';
import 'package:commerce/src/presentation/view/register/register_viewmodel.dart';
import 'package:commerce/src/presentation/view/store_details/store_details_viewmodel.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
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
  final dio = await instance<DioFactory>().getDio();
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
  instance.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImplementer(),
  );
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      instance(),
      instance(),
      instance(),
    ),
  );
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
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

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(
        instance(),
      ),
    );
    instance.registerLazySingleton<ForgetPasswordViewModel>(
      () => ForgetPasswordViewModel(
        instance(),
      ),
    );
  }
}

initRegisterModule() {
  if (!GetIt.I.isRegistered<RegisterUseCase>()) {
    instance.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(
        instance(),
      ),
    );
    instance.registerLazySingleton<RegisterViewModel>(
      () => RegisterViewModel(
        instance(),
      ),
    );
    instance.registerLazySingleton<ImagePicker>(
      () => ImagePicker(),
    );
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerLazySingleton<HomeUseCase>(
      () => HomeUseCase(
        instance(),
      ),
    );
    instance.registerLazySingleton<HomeViewModel>(
      () => HomeViewModel(
        instance(),
      ),
    );
  }
}

initStoreDetailsModule() {
  if (!GetIt.I.isRegistered<StoreDetailsUseCase>()) {
    instance.registerLazySingleton<StoreDetailsUseCase>(
      () => StoreDetailsUseCase(
        instance(),
      ),
    );
    instance.registerLazySingleton<StoreDetailsViewModel>(
      () => StoreDetailsViewModel(
        instance(),
      ),
    );
  }
}

resetAllModules() {
  instance.reset(dispose: false);
  initAppModule();
  initForgotPasswordModule();
  initHomeModule();
  initLoginModule();
  initRegisterModule();
  initStoreDetailsModule();
}
