// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_add_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnnouncementAddStateCWProxy {
  AnnouncementAddState title(String? title);

  AnnouncementAddState content(String? content);

  AnnouncementAddState imageUrl(List<ImageFile>? imageUrl);

  AnnouncementAddState tag(String? tag);

  AnnouncementAddState visibility(String visibility);

  AnnouncementAddState isSelected(int isSelected);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnnouncementAddState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnnouncementAddState(...).copyWith(id: 12, name: "My name")
  /// ````
  AnnouncementAddState call({
    String? title,
    String? content,
    List<ImageFile>? imageUrl,
    String? tag,
    String? visibility,
    int? isSelected,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnnouncementAddState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnnouncementAddState.copyWith.fieldName(...)`
class _$AnnouncementAddStateCWProxyImpl
    implements _$AnnouncementAddStateCWProxy {
  const _$AnnouncementAddStateCWProxyImpl(this._value);

  final AnnouncementAddState _value;

  @override
  AnnouncementAddState title(String? title) => this(title: title);

  @override
  AnnouncementAddState content(String? content) => this(content: content);

  @override
  AnnouncementAddState imageUrl(List<ImageFile>? imageUrl) =>
      this(imageUrl: imageUrl);

  @override
  AnnouncementAddState tag(String? tag) => this(tag: tag);

  @override
  AnnouncementAddState visibility(String visibility) =>
      this(visibility: visibility);

  @override
  AnnouncementAddState isSelected(int isSelected) =>
      this(isSelected: isSelected);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnnouncementAddState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnnouncementAddState(...).copyWith(id: 12, name: "My name")
  /// ````
  AnnouncementAddState call({
    Object? title = const $CopyWithPlaceholder(),
    Object? content = const $CopyWithPlaceholder(),
    Object? imageUrl = const $CopyWithPlaceholder(),
    Object? tag = const $CopyWithPlaceholder(),
    Object? visibility = const $CopyWithPlaceholder(),
    Object? isSelected = const $CopyWithPlaceholder(),
  }) {
    return AnnouncementAddState(
      title: title == const $CopyWithPlaceholder()
          ? _value.title
          // ignore: cast_nullable_to_non_nullable
          : title as String?,
      content: content == const $CopyWithPlaceholder()
          ? _value.content
          // ignore: cast_nullable_to_non_nullable
          : content as String?,
      imageUrl: imageUrl == const $CopyWithPlaceholder()
          ? _value.imageUrl
          // ignore: cast_nullable_to_non_nullable
          : imageUrl as List<ImageFile>?,
      tag: tag == const $CopyWithPlaceholder()
          ? _value.tag
          // ignore: cast_nullable_to_non_nullable
          : tag as String?,
      visibility:
          visibility == const $CopyWithPlaceholder() || visibility == null
              ? _value.visibility
              // ignore: cast_nullable_to_non_nullable
              : visibility as String,
      isSelected:
          isSelected == const $CopyWithPlaceholder() || isSelected == null
              ? _value.isSelected
              // ignore: cast_nullable_to_non_nullable
              : isSelected as int,
    );
  }
}

extension $AnnouncementAddStateCopyWith on AnnouncementAddState {
  /// Returns a callable class that can be used as follows: `instanceOfAnnouncementAddState.copyWith(...)` or like so:`instanceOfAnnouncementAddState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnnouncementAddStateCWProxy get copyWith =>
      _$AnnouncementAddStateCWProxyImpl(this);
}
