// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginObject {
  String get userName => throw _privateConstructorUsedError;
  String get passsword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String userName, String passsword});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? passsword = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      passsword: null == passsword
          ? _value.passsword
          : passsword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginObjectImplCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$LoginObjectImplCopyWith(
          _$LoginObjectImpl value, $Res Function(_$LoginObjectImpl) then) =
      __$$LoginObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userName, String passsword});
}

/// @nodoc
class __$$LoginObjectImplCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$LoginObjectImpl>
    implements _$$LoginObjectImplCopyWith<$Res> {
  __$$LoginObjectImplCopyWithImpl(
      _$LoginObjectImpl _value, $Res Function(_$LoginObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? passsword = null,
  }) {
    return _then(_$LoginObjectImpl(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == passsword
          ? _value.passsword
          : passsword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginObjectImpl implements _LoginObject {
  _$LoginObjectImpl(this.userName, this.passsword);

  @override
  final String userName;
  @override
  final String passsword;

  @override
  String toString() {
    return 'LoginObject(userName: $userName, passsword: $passsword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginObjectImpl &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.passsword, passsword) ||
                other.passsword == passsword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userName, passsword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      __$$LoginObjectImplCopyWithImpl<_$LoginObjectImpl>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String userName, final String passsword) =
      _$LoginObjectImpl;

  @override
  String get userName;
  @override
  String get passsword;
  @override
  @JsonKey(ignore: true)
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordObject {
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordObjectCopyWith<ForgotPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordObjectCopyWith<$Res> {
  factory $ForgotPasswordObjectCopyWith(ForgotPasswordObject value,
          $Res Function(ForgotPasswordObject) then) =
      _$ForgotPasswordObjectCopyWithImpl<$Res, ForgotPasswordObject>;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$ForgotPasswordObjectCopyWithImpl<$Res,
        $Val extends ForgotPasswordObject>
    implements $ForgotPasswordObjectCopyWith<$Res> {
  _$ForgotPasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgotPasswordObjectImplCopyWith<$Res>
    implements $ForgotPasswordObjectCopyWith<$Res> {
  factory _$$ForgotPasswordObjectImplCopyWith(_$ForgotPasswordObjectImpl value,
          $Res Function(_$ForgotPasswordObjectImpl) then) =
      __$$ForgotPasswordObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email});
}

/// @nodoc
class __$$ForgotPasswordObjectImplCopyWithImpl<$Res>
    extends _$ForgotPasswordObjectCopyWithImpl<$Res, _$ForgotPasswordObjectImpl>
    implements _$$ForgotPasswordObjectImplCopyWith<$Res> {
  __$$ForgotPasswordObjectImplCopyWithImpl(_$ForgotPasswordObjectImpl _value,
      $Res Function(_$ForgotPasswordObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
  }) {
    return _then(_$ForgotPasswordObjectImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgotPasswordObjectImpl implements _ForgotPasswordObject {
  _$ForgotPasswordObjectImpl(this.email);

  @override
  final String email;

  @override
  String toString() {
    return 'ForgotPasswordObject(email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgotPasswordObjectImpl &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgotPasswordObjectImplCopyWith<_$ForgotPasswordObjectImpl>
      get copyWith =>
          __$$ForgotPasswordObjectImplCopyWithImpl<_$ForgotPasswordObjectImpl>(
              this, _$identity);
}

abstract class _ForgotPasswordObject implements ForgotPasswordObject {
  factory _ForgotPasswordObject(final String email) =
      _$ForgotPasswordObjectImpl;

  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$ForgotPasswordObjectImplCopyWith<_$ForgotPasswordObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterObject {
  String get countryCode => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get profilePix => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res, RegisterObject>;
  @useResult
  $Res call(
      {String countryCode,
      String username,
      String email,
      String password,
      String mobileNumber,
      String profilePix});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res, $Val extends RegisterObject>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? mobileNumber = null,
    Object? profilePix = null,
  }) {
    return _then(_value.copyWith(
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profilePix: null == profilePix
          ? _value.profilePix
          : profilePix // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterObjectImplCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$$RegisterObjectImplCopyWith(_$RegisterObjectImpl value,
          $Res Function(_$RegisterObjectImpl) then) =
      __$$RegisterObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String countryCode,
      String username,
      String email,
      String password,
      String mobileNumber,
      String profilePix});
}

/// @nodoc
class __$$RegisterObjectImplCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res, _$RegisterObjectImpl>
    implements _$$RegisterObjectImplCopyWith<$Res> {
  __$$RegisterObjectImplCopyWithImpl(
      _$RegisterObjectImpl _value, $Res Function(_$RegisterObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryCode = null,
    Object? username = null,
    Object? email = null,
    Object? password = null,
    Object? mobileNumber = null,
    Object? profilePix = null,
  }) {
    return _then(_$RegisterObjectImpl(
      null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == profilePix
          ? _value.profilePix
          : profilePix // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RegisterObjectImpl implements _RegisterObject {
  _$RegisterObjectImpl(this.countryCode, this.username, this.email,
      this.password, this.mobileNumber, this.profilePix);

  @override
  final String countryCode;
  @override
  final String username;
  @override
  final String email;
  @override
  final String password;
  @override
  final String mobileNumber;
  @override
  final String profilePix;

  @override
  String toString() {
    return 'RegisterObject(countryCode: $countryCode, username: $username, email: $email, password: $password, mobileNumber: $mobileNumber, profilePix: $profilePix)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterObjectImpl &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.profilePix, profilePix) ||
                other.profilePix == profilePix));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryCode, username, email,
      password, mobileNumber, profilePix);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterObjectImplCopyWith<_$RegisterObjectImpl> get copyWith =>
      __$$RegisterObjectImplCopyWithImpl<_$RegisterObjectImpl>(
          this, _$identity);
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(
      final String countryCode,
      final String username,
      final String email,
      final String password,
      final String mobileNumber,
      final String profilePix) = _$RegisterObjectImpl;

  @override
  String get countryCode;
  @override
  String get username;
  @override
  String get email;
  @override
  String get password;
  @override
  String get mobileNumber;
  @override
  String get profilePix;
  @override
  @JsonKey(ignore: true)
  _$$RegisterObjectImplCopyWith<_$RegisterObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
