import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile_models.g.dart';

@JsonSerializable()
class ProfileEvents {
  String id;
  String title;
  DateTime startDate;
  DateTime endDate;

  factory ProfileEvents.fromJson(Map<String, dynamic> json) =>
      _$ProfileEventsFromJson(json);

  ProfileEvents(
      {required this.id,
      required this.title,
      required this.startDate,
      required this.endDate});

  Map<String, dynamic> toJson() => _$ProfileEventsToJson(this);
}

@JsonSerializable()
class ProfileAnnouncements {
  String id;
  String title;
  String visibility;

  factory ProfileAnnouncements.fromJson(Map<String, dynamic> json) =>
      _$ProfileAnnouncementsFromJson(json);

  ProfileAnnouncements(
      {required this.id, required this.title, required this.visibility});

  Map<String, dynamic> toJson() => _$ProfileAnnouncementsToJson(this);
}
