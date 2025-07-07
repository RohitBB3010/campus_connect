import 'dart:convert';

import 'package:campus_connect_frontend/committees/profile/profile_page_state.dart';
import 'package:campus_connect_frontend/models/profile_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit() : super(ProfilePageState());

  Future<void> fetchComitteeProfilePageData(String committeeId) async {
    try {
      emit(ProfilePageLoadingState());

      String userEmail = FirebaseAuth.instance.currentUser!.email!;

      String fetchAPI =
          'http://10.0.2.2:8000/committee/fetch-profile?userEmail=$userEmail&commId=$committeeId';

      final response = await http.get(Uri.parse(fetchAPI));

      final responseBody = jsonDecode(response.body);

      List<ProfileEvents> events = [];
      for (Map<String, dynamic> event in responseBody['events']) {
        ProfileEvents profileEvent = ProfileEvents.fromJson(event);
        events.add(profileEvent);
      }

      debugPrint(responseBody['announcements'].toString());

      List<ProfileAnnouncements> announcements = [];
      for (Map<String, dynamic> announcement in responseBody['announcements']) {
        ProfileAnnouncements profileEvent =
            ProfileAnnouncements.fromJson(announcement);
        announcements.add(profileEvent);
      }

      emit(ProfilePageLoadedState(
          name: responseBody['name'],
          email: responseBody['email'],
          position: responseBody['position'],
          announcements: announcements,
          events: events));
    } catch (err) {
      debugPrint(err.toString());
      emit(ProfilePageErrorState(
          errorMessage: 'Some unexpected error occured', statusCode: 500));
    }
  }
}
