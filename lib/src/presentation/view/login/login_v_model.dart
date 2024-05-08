import 'dart:async';
import 'package:commerce/src/domain/use_case/login/login_use_case.dart';
import 'package:commerce/src/presentation/base/base_viewmodel.dart';
import 'package:commerce/src/presentation/common/state_renderer/state_renderer.dart';
import 'package:commerce/src/presentation/common/state_renderer/state_renderer_implementer.dart';

import '../../common/freezed_data_classes.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInput, LoginViewModelOutput {
  LoginViewModel(this._loginUseCase);

  var loginObject = LoginObject("", "");

  final StreamController _isAllInputValid = StreamController<void>.broadcast();
  final StreamController isUserLoggedInSuccessfully = StreamController<String>();

  final LoginUseCase _loginUseCase;
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();

  @override
  void dispose() {
    _passwordStreamController.close();
    _usernameStreamController.close();
    _isAllInputValid.close();
    isUserLoggedInSuccessfully.close();
  }

  @override
  Sink get inputIsAllInputValid => _isAllInputValid.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  login() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.POPOUP_LOADING_STATE),
    );
    (await _loginUseCase.execute(
      LoginUseCaseInput(loginObject.userName, loginObject.passsword),
    ))
        .fold(
      (failure) => {
        inputState.add(
          ErrorState(StateRendererType.POPUP_ERROR_STATE, failure.message),
        ),
      },
      (data) => {
        inputState.add(
          ContentState(),
        ),
        isUserLoggedInSuccessfully.add("ABCDEFGH")
      },
    );
  }

  @override
  Stream<bool> get outputIsAllInputValid => _isAllInputValid.stream.map(
        (event) => _getIsAllInputValid(),
      );

  @override
  Stream<bool> get outputIsPasswordValid =>
      _passwordStreamController.stream.map(
        (password) => _isPasswordValid(password),
      );

  @override
  Stream<bool> get outputIsUsernameValid =>
      _usernameStreamController.stream.map(
        (username) => _isUsernameValid(username),
      );

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject = loginObject.copyWith(passsword: password);
    _validated();
  }

  @override
  setUsername(String username) {
    inputUsername.add(username);
    loginObject = loginObject.copyWith(userName: username);
    _validated();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  //!Private functions

  _validated() {
    inputIsAllInputValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  bool _isUsernameValid(String username) {
    return username.isNotEmpty;
  }

  bool _getIsAllInputValid() {
    return _isPasswordValid(loginObject.passsword) &&
        _isUsernameValid(loginObject.userName);
  }
}

abstract class LoginViewModelInput {
  setUsername(String username);

  setPassword(String password);

  login();

  Sink get inputUsername;

  Sink get inputPassword;

  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutput {
  Stream<bool> get outputIsUsernameValid;

  Stream<bool> get outputIsPasswordValid;

  Stream<bool> get outputIsAllInputValid;
}
