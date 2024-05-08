import 'dart:async';
import 'dart:io';

import 'package:commerce/src/domain/use_case/register_usecase/register_usecase.dart';
import 'package:commerce/src/presentation/base/base_viewmodel.dart';
import 'package:commerce/src/presentation/common/freezed_data_classes.dart';

import '../../common/state_renderer/state_renderer.dart';
import '../../common/state_renderer/state_renderer_implementer.dart';

class RegisterViewModel extends BaseViewModel
    implements RegisterViewModelInput, RegisterViewModelOutput {
  //
  final RegisterUseCase _registerUseCase;

  RegisterViewModel(this._registerUseCase);
  //
  var registerObject = RegisterObject(
    "",
    "",
    "",
    "",
    "",
    "",
  );

  //
  final StreamController _countryCodeStreamController =
      StreamController<String>.broadcast();
  final StreamController _usernameStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _mobileNumberStreamController =
      StreamController<String>.broadcast();
  final StreamController _profilePixStreamController =
      StreamController<String>.broadcast();
  final StreamController _validatedFieldsStreamController =
      StreamController<void>.broadcast();
  final StreamController isUserLoggedInSuccessfully = StreamController<bool>();
  //
  @override
  Sink get inputCountryMobileCode => _countryCodeStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputMobileNumber => _mobileNumberStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputProfilePix => _profilePixStreamController.sink;

  @override
  Sink get inputUsername => _usernameStreamController.sink;

  @override
  Sink get isAllInputValid => _validatedFieldsStreamController.sink;

  @override
  Stream<String?> get outputCountryCodeError =>
      outputCountryCode.map((isCountryCodeValid) =>
          isCountryCodeValid ? null : "Invalid country code");

  @override
  Stream<String?> get outputEmailError =>
      outputEmail.map((isEmailValid) => isEmailValid ? null : "Invalid email");

  @override
  Stream<String?> get outputMobileNumberError => outputMobileNumber
      .map((isNumberValid) => isNumberValid ? null : "Invalid number");

  @override
  Stream<String?> get outputPasswordError => outputPassword
      .map((isPasswordValid) => isPasswordValid ? null : "Invalid password");

  @override
  Stream<String?> get outputUsernameError => outputUsername
      .map((isUsernameValid) => isUsernameValid ? null : "Invalid password");

  @override
  Stream<bool> get isAllOutputValid =>
      _validatedFieldsStreamController.stream.map(
        (event) => _getAllInputCheck(),
      );

  @override
  Stream<bool> get outputCountryCode => _countryCodeStreamController.stream.map(
        (countryCode) => _isCountryCodeValid(countryCode),
      );

  @override
  Stream<bool> get outputEmail => _emailStreamController.stream.map(
        (email) => _isEmailValid(email),
      );

  @override
  Stream<bool> get outputMobileNumber =>
      _mobileNumberStreamController.stream.map(
        (number) => _isMobileNumberValid(number),
      );

  @override
  Stream<bool> get outputPassword => _passwordStreamController.stream.map(
        (password) => _isPasswordValid(password),
      );

  @override
  Stream<File?> get outputProfilePix => _profilePixStreamController.stream.map(
        (profilePix) => _isProfilePixValid(profilePix),
      );

  @override
  Stream<bool> get outputUsername => _usernameStreamController.stream.map(
        (username) => _isUsernameValid(username),
      );

  @override
  register() async {
    inputState.add(
      LoadingState(stateRendererType: StateRendererType.POPOUP_LOADING_STATE),
    );
    (await _registerUseCase.execute(
      RegisterUseCaseInput(
        registerObject.countryCode,
        registerObject.username,
        registerObject.email,
        registerObject.password,
        registerObject.mobileNumber,
        registerObject.profilePix,
      ),
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
        isUserLoggedInSuccessfully.add(true)
      },
    );
  }

  @override
  setNumber(String number) {
    inputMobileNumber.add(number);
    registerObject = registerObject.copyWith(mobileNumber: number);
    _valid();
  }

  @override
  setCountryCode(String countryCode) {
    inputCountryMobileCode.add(countryCode);
    registerObject = registerObject.copyWith(countryCode: countryCode);
    _valid();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    registerObject = registerObject.copyWith(email: email);
    _valid();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    registerObject = registerObject.copyWith(password: password);
    _valid();
  }

  @override
  setProfilePix(File profilePix) {
    inputProfilePix.add(profilePix);
    registerObject =
        registerObject.copyWith(profilePix: profilePix.path.toString());
    _valid();
  }

  @override
  setUsername(String username) {
    inputUsername.add(username);
    registerObject = registerObject.copyWith(username: username);
    _valid();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void dispose() {
    _countryCodeStreamController.close();
    _usernameStreamController.close();
    _emailStreamController.close();
    _passwordStreamController.close();
    _mobileNumberStreamController.close();
    _profilePixStreamController.close();
    _validatedFieldsStreamController.close();
    isUserLoggedInSuccessfully.close();
  }

  //!Private Functions

  _valid() {
    _validatedFieldsStreamController.add(null);
  }

  bool _isCountryCodeValid(String countryCode) {
    return countryCode.isNotEmpty;
  }

  bool _isUsernameValid(String username) {
    return username.length >= 8 && username.isNotEmpty;
  }

  bool _isEmailValid(String email) {
    return email.isNotEmpty && email.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.length >= 8 && password.isNotEmpty;
  }

  bool _isMobileNumberValid(String number) {
    return number.length == 10 && number.isNotEmpty;
  }

  File _isProfilePixValid(File profilePix) {
    return profilePix;
  }

  bool _getAllInputCheck() {
    return _isCountryCodeValid(registerObject.countryCode) &&
        _isUsernameValid(registerObject.username) &&
        _isEmailValid(registerObject.email) &&
        _isPasswordValid(registerObject.password) &&
        _isMobileNumberValid(registerObject.mobileNumber);
  }
}

// ---- Input & Output Function

abstract class RegisterViewModelInput {
  Sink get inputCountryMobileCode;
  Sink get inputUsername;
  Sink get inputEmail;
  Sink get inputPassword;
  Sink get inputMobileNumber;
  Sink get inputProfilePix;
  Sink get isAllInputValid;

  setCountryCode(String countryCode);
  setUsername(String username);
  setEmail(String email);
  setPassword(String password);
  setNumber(String number);
  setProfilePix(File file);

  register();
}

abstract class RegisterViewModelOutput {
  Stream<bool> get outputCountryCode;
  Stream<String?> get outputCountryCodeError;
  Stream<bool> get outputUsername;
  Stream<String?> get outputUsernameError;
  Stream<bool> get outputEmail;
  Stream<String?> get outputEmailError;
  Stream<bool> get outputPassword;
  Stream<String?> get outputPasswordError;
  Stream<bool> get outputMobileNumber;
  Stream<String?> get outputMobileNumberError;
  Stream<File?> get outputProfilePix;
  Stream<bool> get isAllOutputValid;
}
