import 'package:campus_connect_frontend/models/event_model.dart';

class EventsPageState {}

class EventPageLoadedState extends EventsPageState {
  List<EventModel> events;

  EventPageLoadedState({required this.events});
}

class EventPageLoadingState extends EventsPageState {}

class EventPageErrorState extends EventsPageState {
  String error;
  int statusCode;

  EventPageErrorState({required this.error, required this.statusCode});
}
