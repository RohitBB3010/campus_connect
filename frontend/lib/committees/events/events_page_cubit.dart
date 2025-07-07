import 'dart:convert';
import 'dart:math';

import 'package:campus_connect_frontend/committees/events/events_page_state.dart';
import 'package:campus_connect_frontend/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class EventsPageCubit extends Cubit<EventsPageState> {
  EventsPageCubit() : super(EventsPageState());

  Future<void> fetchEvents(String committeeId) async {
    try {
      String fetchEventsUri =
          "http://10.0.2.2:8000/committee/fetch-events?commId=$committeeId";

      emit(EventPageLoadingState());

      final response = await http.get(Uri.parse(fetchEventsUri));

      final decodedResponseBody = jsonDecode(response.body);

      List<EventModel> events = [];
      debugPrint("Events is ${decodedResponseBody['events']}");
      for (Map<String, dynamic> eventJson in decodedResponseBody['events']) {
        debugPrint(eventJson.toString());
        EventModel event = EventModel.fromJson(eventJson);
        events.add(event);
      }

      emit(EventPageLoadedState(events: events));
    } catch (err) {
      debugPrint(err.toString());
      emit(EventPageErrorState(error: err.toString(), statusCode: 500));
    }
  }
}
