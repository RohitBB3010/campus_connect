import 'dart:convert';

import 'package:campus_connect_frontend/home/announcements/announcement_state.dart';
import 'package:campus_connect_frontend/models/announcement_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AnnouncementHomeCubit extends Cubit<AnnouncementHomeState> {
  AnnouncementHomeCubit() : super(AnnouncementHomeState());

  Future<void> fetchHomeAnnouncements() async {
    try {
      String fetchHomeAnnouncements =
          'http://10.0.2.2:8000/home/fetch-home-announcements';

      String userEmail = FirebaseAuth.instance.currentUser!.email!;

      emit(AnnouncementHomeLoadingState());

      final response = await http
          .get(Uri.parse('$fetchHomeAnnouncements?userEmail=$userEmail'));

      final responseBody = jsonDecode(response.body);

      debugPrint("Response body is : ${responseBody}");

      List<AnnouncementModel> announcements = [];
      if (response.statusCode == 200) {
        for (Map<String, dynamic> obj in responseBody['announcements']) {
          AnnouncementModel announcement = AnnouncementModel.fromJson(obj);
          announcements.add(announcement);
        }

        emit(AnnouncementHomeLoadedState(announcements: announcements));
      } else {
        emit(AnnouncementHomeErrorState());
      }
    } catch (err) {
      emit(AnnouncementHomeErrorState());
    }
  }
}
