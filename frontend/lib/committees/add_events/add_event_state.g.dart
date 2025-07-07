// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_event_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AddEventStateCWProxy {
  AddEventState eventName(String? eventName);

  AddEventState description(String? description);

  AddEventState tag(String? tag);

  AddEventState venue(String? venue);

  AddEventState startTime(DateTime? startTime);

  AddEventState endTime(DateTime? endTime);

  AddEventState registrationLink(String? registrationLink);

  AddEventState eligibility(String? eligibility);

  AddEventState head(MemberDetails? head);

  AddEventState coHead(MemberDetails? coHead);

  AddEventState members(List<MemberDetails>? members);

  AddEventState images(List<ImageFile>? images);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddEventState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddEventState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddEventState call({
    String? eventName,
    String? description,
    String? tag,
    String? venue,
    DateTime? startTime,
    DateTime? endTime,
    String? registrationLink,
    String? eligibility,
    MemberDetails? head,
    MemberDetails? coHead,
    List<MemberDetails>? members,
    List<ImageFile>? images,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAddEventState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAddEventState.copyWith.fieldName(...)`
class _$AddEventStateCWProxyImpl implements _$AddEventStateCWProxy {
  const _$AddEventStateCWProxyImpl(this._value);

  final AddEventState _value;

  @override
  AddEventState eventName(String? eventName) => this(eventName: eventName);

  @override
  AddEventState description(String? description) =>
      this(description: description);

  @override
  AddEventState tag(String? tag) => this(tag: tag);

  @override
  AddEventState venue(String? venue) => this(venue: venue);

  @override
  AddEventState startTime(DateTime? startTime) => this(startTime: startTime);

  @override
  AddEventState endTime(DateTime? endTime) => this(endTime: endTime);

  @override
  AddEventState registrationLink(String? registrationLink) =>
      this(registrationLink: registrationLink);

  @override
  AddEventState eligibility(String? eligibility) =>
      this(eligibility: eligibility);

  @override
  AddEventState head(MemberDetails? head) => this(head: head);

  @override
  AddEventState coHead(MemberDetails? coHead) => this(coHead: coHead);

  @override
  AddEventState members(List<MemberDetails>? members) => this(members: members);

  @override
  AddEventState images(List<ImageFile>? images) => this(images: images);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AddEventState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AddEventState(...).copyWith(id: 12, name: "My name")
  /// ````
  AddEventState call({
    Object? eventName = const $CopyWithPlaceholder(),
    Object? description = const $CopyWithPlaceholder(),
    Object? tag = const $CopyWithPlaceholder(),
    Object? venue = const $CopyWithPlaceholder(),
    Object? startTime = const $CopyWithPlaceholder(),
    Object? endTime = const $CopyWithPlaceholder(),
    Object? registrationLink = const $CopyWithPlaceholder(),
    Object? eligibility = const $CopyWithPlaceholder(),
    Object? head = const $CopyWithPlaceholder(),
    Object? coHead = const $CopyWithPlaceholder(),
    Object? members = const $CopyWithPlaceholder(),
    Object? images = const $CopyWithPlaceholder(),
  }) {
    return AddEventState(
      eventName: eventName == const $CopyWithPlaceholder()
          ? _value.eventName
          // ignore: cast_nullable_to_non_nullable
          : eventName as String?,
      description: description == const $CopyWithPlaceholder()
          ? _value.description
          // ignore: cast_nullable_to_non_nullable
          : description as String?,
      tag: tag == const $CopyWithPlaceholder()
          ? _value.tag
          // ignore: cast_nullable_to_non_nullable
          : tag as String?,
      venue: venue == const $CopyWithPlaceholder()
          ? _value.venue
          // ignore: cast_nullable_to_non_nullable
          : venue as String?,
      startTime: startTime == const $CopyWithPlaceholder()
          ? _value.startTime
          // ignore: cast_nullable_to_non_nullable
          : startTime as DateTime?,
      endTime: endTime == const $CopyWithPlaceholder()
          ? _value.endTime
          // ignore: cast_nullable_to_non_nullable
          : endTime as DateTime?,
      registrationLink: registrationLink == const $CopyWithPlaceholder()
          ? _value.registrationLink
          // ignore: cast_nullable_to_non_nullable
          : registrationLink as String?,
      eligibility: eligibility == const $CopyWithPlaceholder()
          ? _value.eligibility
          // ignore: cast_nullable_to_non_nullable
          : eligibility as String?,
      head: head == const $CopyWithPlaceholder()
          ? _value.head
          // ignore: cast_nullable_to_non_nullable
          : head as MemberDetails?,
      coHead: coHead == const $CopyWithPlaceholder()
          ? _value.coHead
          // ignore: cast_nullable_to_non_nullable
          : coHead as MemberDetails?,
      members: members == const $CopyWithPlaceholder()
          ? _value.members
          // ignore: cast_nullable_to_non_nullable
          : members as List<MemberDetails>?,
      images: images == const $CopyWithPlaceholder()
          ? _value.images
          // ignore: cast_nullable_to_non_nullable
          : images as List<ImageFile>?,
    );
  }
}

extension $AddEventStateCopyWith on AddEventState {
  /// Returns a callable class that can be used as follows: `instanceOfAddEventState.copyWith(...)` or like so:`instanceOfAddEventState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AddEventStateCWProxy get copyWith => _$AddEventStateCWProxyImpl(this);
}
