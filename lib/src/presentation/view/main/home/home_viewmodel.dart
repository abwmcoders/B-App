import 'dart:async';
import 'dart:ffi';

import 'package:commerce/src/domain/model/model.dart';
import 'package:commerce/src/domain/use_case/home_usecase/home_usecase.dart';
import 'package:commerce/src/presentation/base/base_viewmodel.dart';
import 'package:commerce/src/presentation/common/state_renderer/state_renderer.dart';
import 'package:commerce/src/presentation/common/state_renderer/state_renderer_implementer.dart';
import 'package:rxdart/rxdart.dart';

class HomeViewModel extends BaseViewModel
    implements HomeViewModelInputs, HomeViewModelOutputs {
  //
  final _dataStreamController = BehaviorSubject<HomeData>();

  //
  final HomeUseCase _homeUseCase;
  HomeViewModel(this._homeUseCase);

  @override
  void start() {
    _getHome();
  }

  _getHome() async {
    inputState.add(
      LoadingState(
          stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE),
    );
    // ignore: void_checks
    (await _homeUseCase.execute(Void)).fold(
      (failure) {
        inputState.add(
          ErrorState(
            StateRendererType.FULL_SCREEN_ERROR_STATE,
            failure.message,
          ),
        );
      },
      (data) {
        inputState.add(
          ContentState(),
        );
        inputHomeData.add(
          HomeData(
            data.homeData!.services,
            data.homeData!.banners,
            data.homeData!.stores,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  @override
  Sink get inputHomeData => _dataStreamController.sink;

  @override
  Stream<HomeData> get outputHomeData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class HomeViewModelInputs {
  Sink get inputHomeData;
}

abstract class HomeViewModelOutputs {
  Stream<HomeData> get outputHomeData;
}
