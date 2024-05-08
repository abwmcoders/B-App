import 'dart:ffi';

import 'package:commerce/src/domain/use_case/store_details/store_details_usecase.dart';
import 'package:commerce/src/presentation/base/base_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

import '../../../domain/model/model.dart';
import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_implementer.dart';

class StoreDetailsViewModel extends BaseViewModel
    implements StoreDetailsInput, StoreDetailsOutput {
  final StoreDetailsUseCase _storeDetailsUseCase;

  final _dataStreamController = BehaviorSubject<StoreDetails>();

  StoreDetailsViewModel(this._storeDetailsUseCase);
  @override
  void start() {
    _getStoreDetails();
  }

  @override
  void dispose() {
    _dataStreamController.close();
    super.dispose();
  }

  _getStoreDetails() async {
    inputState.add(
      LoadingState(
          stateRendererType: StateRendererType.FULL_SCREEN_LOADING_STATE),
    );
    // ignore: void_checks
    (await _storeDetailsUseCase.execute(Void)).fold(
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
        inputState.add(
          StoreDetails(
            data.id!,
            data.title!,
            data.image!,
            data.details!,
            data.services,
            data.about!,
          ),
        );
      },
    );
  }

  @override
  Sink get inputStoreDetailsData => _dataStreamController.sink;

  @override
  Stream<StoreDetails> get outputStoreDetailsData =>
      _dataStreamController.stream.map((data) => data);
}

abstract class StoreDetailsInput {
  Sink get inputStoreDetailsData;
}

abstract class StoreDetailsOutput {
  Stream<StoreDetails> get outputStoreDetailsData;
}
