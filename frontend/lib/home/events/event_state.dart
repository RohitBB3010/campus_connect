import 'package:campus_connect_frontend/models/event_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';

part 'event_state.g.dart';

class EventState {}

class EventLoadingState extends EventState {}

@CopyWith()
class EventLoadedState extends EventState {
  List<EventModel> events;
  List<EventModel> displayEvents;

  String? filterCommitteeName;
  String? searchEventName;
  DateTime? afterTime;
  DateTime? beforeTime;

  EventLoadedState(
      {required this.events,
      required this.displayEvents,
      this.filterCommitteeName,
      this.searchEventName,
      this.afterTime,
      this.beforeTime});
}

class EventErrorState extends EventState {
  String error;

  EventErrorState({required this.error});
}
