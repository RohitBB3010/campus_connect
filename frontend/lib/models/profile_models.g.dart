// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileEvents _$ProfileEventsFromJson(Map<String, dynamic> json) =>
    ProfileEvents(
      id: json['id'] as String,
      title: json['title'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$ProfileEventsToJson(ProfileEvents instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
    };

ProfileAnnouncements _$ProfileAnnouncementsFromJson(
        Map<String, dynamic> json) =>
    ProfileAnnouncements(
      id: json['id'] as String,
      title: json['title'] as String,
      visibility: json['visibility'] as String,
    );

Map<String, dynamic> _$ProfileAnnouncementsToJson(
        ProfileAnnouncements instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'visibility': instance.visibility,
    };
