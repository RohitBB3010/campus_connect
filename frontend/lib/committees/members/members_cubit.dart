import 'dart:convert';

import 'package:campus_connect_frontend/committees/members/members_state.dart';
import 'package:campus_connect_frontend/models/committee_model.dart';
import 'package:campus_connect_frontend/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MembersCubit extends Cubit<MembersState> {
  MembersCubit() : super(MembersState());

  Future<void> fetchMembers(String committeeId) async {
    try {
      String fetchMembersUri =
          "http://10.0.2.2:8000/committee/fetch-members?commId=$committeeId";

      emit(MembersLoadingState());

      final response = await http.get(Uri.parse(fetchMembersUri));

      final responseBody = jsonDecode(response.body);

      List<MemberDetails> members = [];

      for (Map<String, dynamic> item in responseBody['members']) {
        MemberDetails member = MemberDetails.fromJson(item);
        members.add(member);
      }

      if (response.statusCode == 200) {
        emit(MembersLoadedState(members: members));
      }
    } catch (err) {
      debugPrint(err.toString());
      emit(MembersErrorState(
          statusCode: 500, errorMessage: "Some unexpected error occured"));
    }
  }
}
