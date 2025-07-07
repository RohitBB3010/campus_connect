import 'dart:convert';

import 'package:campus_connect_frontend/home/events/event_state.dart';
import 'package:campus_connect_frontend/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventState());

  Future<void> fetchEventsData() async {
    try {
      String fetchHomeUri =
          'http://10.0.2.2:8000/home/fetch-home-events?emailId=';

      String userEmail = FirebaseAuth.instance.currentUser!.email!;

      emit(EventLoadingState());

      final response = await http.get(Uri.parse('$fetchHomeUri$userEmail'));

      final responseBody = jsonDecode(response.body);

      List<EventModel> events = [];
      for (final eventObj in responseBody['events']) {
        EventModel event = EventModel.fromJson(eventObj);
        events.add(event);
      }

      if (response.statusCode == 200) {
        emit(EventLoadedState(
          events: events,
          displayEvents: events,
        ));
      }
    } catch (err) {
      debugPrint(err.toString());
      emit(EventErrorState(error: err.toString()));
    }
  }

  void searchEventNameChanged(String searchText, List<EventModel> events) {
    try {
      List<EventModel> filteredEvents = [];

      filteredEvents = events.where((event) {
        return event.eventName.toLowerCase().contains(searchText.toLowerCase());
      }).toList();

      debugPrint(filteredEvents.toString());

      emit((state as EventLoadedState).copyWith(
          displayEvents: filteredEvents, searchEventName: searchText));
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void searchCommiteeFilterChanged(
      String committeeName, List<EventModel> events) {
    try {
      List<EventModel> filteredEvents = [];

      filteredEvents = events.where((event) {
        return event.committeeName!.toLowerCase() ==
            committeeName.toLowerCase();
      }).toList();

      emit((state as EventLoadedState).copyWith(
          filterCommitteeName: committeeName, displayEvents: filteredEvents));
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void filterValueChanged(List<EventModel> events, String? searchEventName,
      String? filterCommitteeName) {
    try {
      List<EventModel> filteredEvents = events;

      if (searchEventName != null && searchEventName.isNotEmpty) {
        filteredEvents = filteredEvents.where((event) {
          return event.eventName
              .toLowerCase()
              .contains(searchEventName.toLowerCase());
        }).toList();
      }

      if (filterCommitteeName != null && filterCommitteeName.isNotEmpty) {
        filteredEvents = filteredEvents.where((event) {
          return event.committeeName!.toLowerCase() ==
              filterCommitteeName.toLowerCase();
        }).toList();
      }

      emit((state as EventLoadedState).copyWith(
        searchEventName: searchEventName,
        filterCommitteeName: filterCommitteeName,
        displayEvents: filteredEvents,
      ));
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  void committeeFilterRemoved(
      String? searchEventName, List<EventModel> events) {
    filterValueChanged(events, null, null);
  }
}
