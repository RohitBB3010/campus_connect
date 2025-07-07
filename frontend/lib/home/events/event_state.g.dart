// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$EventLoadedStateCWProxy {
  EventLoadedState events(List<EventModel> events);

  EventLoadedState displayEvents(List<EventModel> displayEvents);

  EventLoadedState filterCommitteeName(String? filterCommitteeName);

  EventLoadedState searchEventName(String? searchEventName);

  EventLoadedState afterTime(DateTime? afterTime);

  EventLoadedState beforeTime(DateTime? beforeTime);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EventLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EventLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  EventLoadedState call({
    List<EventModel>? events,
    List<EventModel>? displayEvents,
    String? filterCommitteeName,
    String? searchEventName,
    DateTime? afterTime,
    DateTime? beforeTime,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfEventLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfEventLoadedState.copyWith.fieldName(...)`
class _$EventLoadedStateCWProxyImpl implements _$EventLoadedStateCWProxy {
  const _$EventLoadedStateCWProxyImpl(this._value);

  final EventLoadedState _value;

  @override
  EventLoadedState events(List<EventModel> events) => this(events: events);

  @override
  EventLoadedState displayEvents(List<EventModel> displayEvents) =>
      this(displayEvents: displayEvents);

  @override
  EventLoadedState filterCommitteeName(String? filterCommitteeName) =>
      this(filterCommitteeName: filterCommitteeName);

  @override
  EventLoadedState searchEventName(String? searchEventName) =>
      this(searchEventName: searchEventName);

  @override
  EventLoadedState afterTime(DateTime? afterTime) => this(afterTime: afterTime);

  @override
  EventLoadedState beforeTime(DateTime? beforeTime) =>
      this(beforeTime: beforeTime);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `EventLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// EventLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  EventLoadedState call({
    Object? events = const $CopyWithPlaceholder(),
    Object? displayEvents = const $CopyWithPlaceholder(),
    Object? filterCommitteeName = const $CopyWithPlaceholder(),
    Object? searchEventName = const $CopyWithPlaceholder(),
    Object? afterTime = const $CopyWithPlaceholder(),
    Object? beforeTime = const $CopyWithPlaceholder(),
  }) {
    return EventLoadedState(
      events: events == const $CopyWithPlaceholder() || events == null
          ? _value.events
          // ignore: cast_nullable_to_non_nullable
          : events as List<EventModel>,
      displayEvents:
          displayEvents == const $CopyWithPlaceholder() || displayEvents == null
              ? _value.displayEvents
              // ignore: cast_nullable_to_non_nullable
              : displayEvents as List<EventModel>,
      filterCommitteeName: filterCommitteeName == const $CopyWithPlaceholder()
          ? _value.filterCommitteeName
          // ignore: cast_nullable_to_non_nullable
          : filterCommitteeName as String?,
      searchEventName: searchEventName == const $CopyWithPlaceholder()
          ? _value.searchEventName
          // ignore: cast_nullable_to_non_nullable
          : searchEventName as String?,
      afterTime: afterTime == const $CopyWithPlaceholder()
          ? _value.afterTime
          // ignore: cast_nullable_to_non_nullable
          : afterTime as DateTime?,
      beforeTime: beforeTime == const $CopyWithPlaceholder()
          ? _value.beforeTime
          // ignore: cast_nullable_to_non_nullable
          : beforeTime as DateTime?,
    );
  }
}

extension $EventLoadedStateCopyWith on EventLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfEventLoadedState.copyWith(...)` or like so:`instanceOfEventLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$EventLoadedStateCWProxy get copyWith => _$EventLoadedStateCWProxyImpl(this);
}
