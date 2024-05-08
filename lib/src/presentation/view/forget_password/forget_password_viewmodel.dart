import 'dart:async';

import 'package:commerce/src/domain/use_case/forgot_password/forgot_password_use_case.dart';
import 'package:commerce/src/presentation/base/base_viewmodel.dart';
import 'package:commerce/src/presentation/common/freezed_data_classes.dart';

import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_implementer.dart';

class ForgetPasswordViewModel extends BaseViewModel
    implements ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  //
  final ForgotPasswordUseCase _forgotPasswordUseCase;

  ForgetPasswordViewModel(this._forgotPasswordUseCase);

  //
  var forgotPasswordObject = ForgotPasswordObject("");
  final StreamController _isEmailValidStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllValiddStreamController =
      StreamController<bool>.broadcast();

  @override
  void dispose() {
    _isEmailValidStreamController.close();
    _isAllValiddStreamController.close();
  }

  //
  @override
  Sink get isEmailValidInput => _isEmailValidStreamController.sink;

  @override
  Stream<bool> get isEmailValidOutput =>
      _isEmailValidStreamController.stream.map((email) => _isEmailValid(email));

  @override
  forgetPassword() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.POPOUP_LOADING_STATE),
    );
    (await _forgotPasswordUseCase
            .execute(ForgotPasswordUseCAseInput(forgotPasswordObject.email)))
        .fold(
      (failure) => {
        inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message),
        ),
      },
      (data) => {
        inputState.add(
          SuccessState(data.email), //! update to support
        ),
      },
    );
  }

  @override
  setEmail(String email) {
    isEmailValidInput.add(email);
    forgotPasswordObject = forgotPasswordObject.copyWith(email: email);
    _validate();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  Sink get isAllInputValid => _isAllValiddStreamController.sink;

  @override
  Stream<bool> get isAllOutputValid => _isAllValiddStreamController.stream
      .map((isValid) => _confirmInputValid());

  // private
  bool _isEmailValid(String email) {
    return email.isNotEmpty;
  }

  bool _confirmInputValid() {
    return _isEmailValid(forgotPasswordObject.email);
  }

  _validate() {
    isAllInputValid.add(null);
  }
}

abstract class ForgotPasswordViewModelInput {
  setEmail(String email);
  forgetPassword();
  Sink get isEmailValidInput;
  Sink get isAllInputValid;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<bool> get isEmailValidOutput;
  Stream<bool> get isAllOutputValid;
}
