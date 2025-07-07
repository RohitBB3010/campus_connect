import 'dart:convert';

import 'package:campus_connect_frontend/committees/add_events/add_event_state.dart';
import 'package:campus_connect_frontend/committees/members/members_state.dart';
import 'package:campus_connect_frontend/models/committee_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class AddEventCubit extends Cubit<AddEventState> {
  AddEventCubit() : super(AddEventState());

  Future<void> fetchMembers(String committeeId) async {
    try {
      String fetchMembersUri =
          "http://10.0.2.2:8000/committee/fetch-members?commId=$committeeId";

      final response = await http.get(Uri.parse(fetchMembersUri));

      final responseBody = jsonDecode(response.body);

      List<MemberDetails> members = [];

      debugPrint(response.statusCode.toString());

      for (Map<String, dynamic> item in responseBody['members']) {
        MemberDetails member = MemberDetails.fromJson(item);
        members.add(member);
      }

      if (response.statusCode == 200) {
        emit(state.copyWith(members: members));
      }
    } catch (err) {
      debugPrint(err.toString());
    }
  }

  Future<bool> addEvent(
      String title,
      String description,
      String tag,
      String venue,
      DateTime startTime,
      DateTime endTime,
      List<ImageFile>? images,
      MemberDetails head,
      String committeeId,
      MemberDetails coHead,
      String? registrationLink,
      String eligibility) async {
    String addEventUrl = 'http://10.0.2.2:8000/committee/add-event';

    var request = http.MultipartRequest('POST', Uri.parse(addEventUrl));

    String formattedStartTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(startTime);
    String formattedEndTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(endTime);

    request.fields['name'] = title;
    request.fields['description'] = description;
    request.fields['tag'] = tag;
    request.fields['startTime'] = formattedEndTime;
    request.fields['endTime'] = formattedEndTime;
    request.fields['committeeId'] = committeeId;
    request.fields['headEmail'] = head.email!;
    request.fields['coHeadEmail'] = coHead.email!;
    request.fields['venue'] = venue;
    request.fields['authorEmail'] = FirebaseAuth.instance.currentUser!.email!;
    if (registrationLink != null) {
      request.fields['registrationLink'] = registrationLink;
    }
    request.fields['eligibility'] = eligibility;

    debugPrint(state.images!.length.toString());
    if (images != null) {
      for (var image in images) {
        var file = await http.MultipartFile.fromPath('image', image.path!,
            contentType: MediaType('image', 'png'));
        request.files.add(file);
      }
    }

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      debugPrint(err.toString());
      return false;
    }
  }

  void eventNameChanged(String eventName) {
    emit(state.copyWith(eventName: eventName));
  }

  void descriptionChanged(String description) {
    emit(state.copyWith(description: description));
  }

  void tagChanged(String tag) {
    emit(state.copyWith(tag: tag));
  }

  void venueChanged(String venue) {
    emit(state.copyWith(venue: venue));
  }

  void startTimeChanged(DateTime startTime) {
    emit(state.copyWith(startTime: startTime));
  }

  void endTimeChanged(DateTime endTime) {
    emit(state.copyWith(endTime: endTime));
  }

  void registrationLinkChanged(String registrationLink) {
    emit(state.copyWith(registrationLink: registrationLink));
  }

  void eligibilityChanged(String eligibility) {
    emit(state.copyWith(eligibility: eligibility));
  }

  void headChanged(MemberDetails head) {
    emit(state.copyWith(head: head));
  }

  void imageAdded(List<ImageFile> added) {
    List<ImageFile> images;

    if (state.images == null) {
      images = added;
    } else {
      images = [...state.images!, ...added];
    }

    emit((state).copyWith(images: images));
  }

  void removeImage(ImageFile imageFile) {
    final updatedImages =
        state.images!.where((file) => file.bytes != imageFile.bytes).toList();
    emit(state.copyWith(images: updatedImages));
  }

  void coHeadChanged(MemberDetails coHead) {
    emit(state.copyWith(coHead: coHead));
  }
}
