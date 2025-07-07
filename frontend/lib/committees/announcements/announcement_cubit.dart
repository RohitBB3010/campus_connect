import 'dart:convert';

import 'package:campus_connect_frontend/committees/announcements/annoncement_state.dart';
import 'package:campus_connect_frontend/models/announcement_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class AnnouncementCubit extends Cubit<AnnouncementState> {
  AnnouncementCubit() : super(AnnouncementErrorState());

  Future<void> fetchAnnouncements(String committeeId) async {
    try {
      emit(AnnouncementLoadingState());
      String email = FirebaseAuth.instance.currentUser!.email!;
      String fetchAnnouncementAPI =
          "http://10.0.2.2:8000/committee/fetch-announcements?commId=$committeeId&userEmail=$email";

      final response = await http.get(Uri.parse(fetchAnnouncementAPI));

      final responseBody = jsonDecode(response.body);

      List<AnnouncementModel> announcements = [];
      for (Map<String, dynamic> item in responseBody['announcements']) {
        AnnouncementModel ann = AnnouncementModel.fromJson(item);
        announcements.add(ann);
      }

      emit(AnnouncementLoadedState(announcements: announcements));
    } catch (err) {
      debugPrint(err.toString());
    }
  }
}
