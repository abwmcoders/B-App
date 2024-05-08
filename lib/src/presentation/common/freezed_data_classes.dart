import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject implements _$LoginObject {
  factory LoginObject(String userName, String passsword) = _LoginObject;
  
  @override
  // TODO: implement copyWith
  $LoginObjectCopyWith<LoginObject> get copyWith => throw UnimplementedError();
  
  @override
  // TODO: implement passsword
  String get passsword => throw UnimplementedError();
  
  @override
  // TODO: implement userName
  String get userName => throw UnimplementedError();
}

@freezed
class ForgotPasswordObject implements _$ForgotPasswordObject {
  factory ForgotPasswordObject(
    String email,
  ) = _ForgotPasswordObject;
  
  @override
  // TODO: implement copyWith
  $ForgotPasswordObjectCopyWith<ForgotPasswordObject> get copyWith => throw UnimplementedError();
  
  @override
  // TODO: implement email
  String get email => throw UnimplementedError();
}

@freezed
class RegisterObject implements _$RegisterObject {
  factory RegisterObject(
    String countryCode,
    String username,
    String email,
    String password,
    String mobileNumber,
    String profilePix,
  ) = _RegisterObject;
  
  @override
  // TODO: implement copyWith
  $RegisterObjectCopyWith<RegisterObject> get copyWith => throw UnimplementedError();
  
  @override
  // TODO: implement countryCode
  String get countryCode => throw UnimplementedError();
  
  @override
  // TODO: implement email
  String get email => throw UnimplementedError();
  
  @override
  // TODO: implement mobileNumber
  String get mobileNumber => throw UnimplementedError();
  
  @override
  // TODO: implement password
  String get password => throw UnimplementedError();
  
  @override
  // TODO: implement profilePix
  String get profilePix => throw UnimplementedError();
  
  @override
  // TODO: implement username
  String get username => throw UnimplementedError();
}
