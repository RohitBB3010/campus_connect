// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SignupStateCWProxy {
  SignupState name(String? name);

  SignupState email(String? email);

  SignupState password(String? password);

  SignupState confirmPassword(String? confirmPassword);

  SignupState errorMessage(String? errorMessage);

  SignupState isPasswordVisible(bool? isPasswordVisible);

  SignupState isConfirmPasswordVisible(bool? isConfirmPasswordVisible);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SignupState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SignupState(...).copyWith(id: 12, name: "My name")
  /// ````
  SignupState call({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? errorMessage,
    bool? isPasswordVisible,
    bool? isConfirmPasswordVisible,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSignupState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSignupState.copyWith.fieldName(...)`
class _$SignupStateCWProxyImpl implements _$SignupStateCWProxy {
  const _$SignupStateCWProxyImpl(this._value);

  final SignupState _value;

  @override
  SignupState name(String? name) => this(name: name);

  @override
  SignupState email(String? email) => this(email: email);

  @override
  SignupState password(String? password) => this(password: password);

  @override
  SignupState confirmPassword(String? confirmPassword) =>
      this(confirmPassword: confirmPassword);

  @override
  SignupState errorMessage(String? errorMessage) =>
      this(errorMessage: errorMessage);

  @override
  SignupState isPasswordVisible(bool? isPasswordVisible) =>
      this(isPasswordVisible: isPasswordVisible);

  @override
  SignupState isConfirmPasswordVisible(bool? isConfirmPasswordVisible) =>
      this(isConfirmPasswordVisible: isConfirmPasswordVisible);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SignupState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SignupState(...).copyWith(id: 12, name: "My name")
  /// ````
  SignupState call({
    Object? name = const $CopyWithPlaceholder(),
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? confirmPassword = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? isPasswordVisible = const $CopyWithPlaceholder(),
    Object? isConfirmPasswordVisible = const $CopyWithPlaceholder(),
  }) {
    return SignupState(
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      confirmPassword: confirmPassword == const $CopyWithPlaceholder()
          ? _value.confirmPassword
          // ignore: cast_nullable_to_non_nullable
          : confirmPassword as String?,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as String?,
      isPasswordVisible: isPasswordVisible == const $CopyWithPlaceholder()
          ? _value.isPasswordVisible
          // ignore: cast_nullable_to_non_nullable
          : isPasswordVisible as bool?,
      isConfirmPasswordVisible:
          isConfirmPasswordVisible == const $CopyWithPlaceholder()
              ? _value.isConfirmPasswordVisible
              // ignore: cast_nullable_to_non_nullable
              : isConfirmPasswordVisible as bool?,
    );
  }
}

extension $SignupStateCopyWith on SignupState {
  /// Returns a callable class that can be used as follows: `instanceOfSignupState.copyWith(...)` or like so:`instanceOfSignupState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SignupStateCWProxy get copyWith => _$SignupStateCWProxyImpl(this);
}

abstract class _$SigninStateCWProxy {
  SigninState email(String? email);

  SigninState password(String? password);

  SigninState errorMessage(String? errorMessage);

  SigninState isPasswordVisible(bool? isPasswordVisible);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SigninState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SigninState(...).copyWith(id: 12, name: "My name")
  /// ````
  SigninState call({
    String? email,
    String? password,
    String? errorMessage,
    bool? isPasswordVisible,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSigninState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSigninState.copyWith.fieldName(...)`
class _$SigninStateCWProxyImpl implements _$SigninStateCWProxy {
  const _$SigninStateCWProxyImpl(this._value);

  final SigninState _value;

  @override
  SigninState email(String? email) => this(email: email);

  @override
  SigninState password(String? password) => this(password: password);

  @override
  SigninState errorMessage(String? errorMessage) =>
      this(errorMessage: errorMessage);

  @override
  SigninState isPasswordVisible(bool? isPasswordVisible) =>
      this(isPasswordVisible: isPasswordVisible);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SigninState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SigninState(...).copyWith(id: 12, name: "My name")
  /// ````
  SigninState call({
    Object? email = const $CopyWithPlaceholder(),
    Object? password = const $CopyWithPlaceholder(),
    Object? errorMessage = const $CopyWithPlaceholder(),
    Object? isPasswordVisible = const $CopyWithPlaceholder(),
  }) {
    return SigninState(
      email: email == const $CopyWithPlaceholder()
          ? _value.email
          // ignore: cast_nullable_to_non_nullable
          : email as String?,
      password: password == const $CopyWithPlaceholder()
          ? _value.password
          // ignore: cast_nullable_to_non_nullable
          : password as String?,
      errorMessage: errorMessage == const $CopyWithPlaceholder()
          ? _value.errorMessage
          // ignore: cast_nullable_to_non_nullable
          : errorMessage as String?,
      isPasswordVisible: isPasswordVisible == const $CopyWithPlaceholder()
          ? _value.isPasswordVisible
          // ignore: cast_nullable_to_non_nullable
          : isPasswordVisible as bool?,
    );
  }
}

extension $SigninStateCopyWith on SigninState {
  /// Returns a callable class that can be used as follows: `instanceOfSigninState.copyWith(...)` or like so:`instanceOfSigninState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SigninStateCWProxy get copyWith => _$SigninStateCWProxyImpl(this);
}
