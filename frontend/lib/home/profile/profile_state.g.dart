// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ProfileLoadedStateCWProxy {
  ProfileLoadedState user(User? user);

  ProfileLoadedState modName(String? modName);

  ProfileLoadedState modEmail(String? modEmail);

  ProfileLoadedState image(PlatformFile? image);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileLoadedState call({
    User? user,
    String? modName,
    String? modEmail,
    PlatformFile? image,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfProfileLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfProfileLoadedState.copyWith.fieldName(...)`
class _$ProfileLoadedStateCWProxyImpl implements _$ProfileLoadedStateCWProxy {
  const _$ProfileLoadedStateCWProxyImpl(this._value);

  final ProfileLoadedState _value;

  @override
  ProfileLoadedState user(User? user) => this(user: user);

  @override
  ProfileLoadedState modName(String? modName) => this(modName: modName);

  @override
  ProfileLoadedState modEmail(String? modEmail) => this(modEmail: modEmail);

  @override
  ProfileLoadedState image(PlatformFile? image) => this(image: image);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ProfileLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ProfileLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  ProfileLoadedState call({
    Object? user = const $CopyWithPlaceholder(),
    Object? modName = const $CopyWithPlaceholder(),
    Object? modEmail = const $CopyWithPlaceholder(),
    Object? image = const $CopyWithPlaceholder(),
  }) {
    return ProfileLoadedState(
      user: user == const $CopyWithPlaceholder()
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User?,
      modName: modName == const $CopyWithPlaceholder()
          ? _value.modName
          // ignore: cast_nullable_to_non_nullable
          : modName as String?,
      modEmail: modEmail == const $CopyWithPlaceholder()
          ? _value.modEmail
          // ignore: cast_nullable_to_non_nullable
          : modEmail as String?,
      image: image == const $CopyWithPlaceholder()
          ? _value.image
          // ignore: cast_nullable_to_non_nullable
          : image as PlatformFile?,
    );
  }
}

extension $ProfileLoadedStateCopyWith on ProfileLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfProfileLoadedState.copyWith(...)` or like so:`instanceOfProfileLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ProfileLoadedStateCWProxy get copyWith =>
      _$ProfileLoadedStateCWProxyImpl(this);
}
