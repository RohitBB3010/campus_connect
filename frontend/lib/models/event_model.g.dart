// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      eventName: json['eventName'] as String,
      description: json['description'] as String,
      committeeId: json['committeeId'] as String,
      venue: json['venue'] as String,
      tag: json['tag'] as String,
      registrationLink: json['registrationLink'] as String?,
      startTime: DateTime.parse(json['startTime'] as String),
      endTime: DateTime.parse(json['endTime'] as String),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      eligibility: json['eligibility'] as String,
      head: json['head'] as String,
      coHead: json['coHead'] as String,
      headEmail: json['headEmail'] as String,
      coHeadEmail: json['coHeadEmail'] as String,
      committeeName: json['committeeName'] as String?,
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      'eventName': instance.eventName,
      'description': instance.description,
      'committeeId': instance.committeeId,
      'venue': instance.venue,
      'tag': instance.tag,
      'registrationLink': instance.registrationLink,
      'startTime': instance.startTime.toIso8601String(),
      'endTime': instance.endTime.toIso8601String(),
      'images': instance.images,
      'eligibility': instance.eligibility,
      'head': instance.head,
      'coHead': instance.coHead,
      'headEmail': instance.headEmail,
      'coHeadEmail': instance.coHeadEmail,
      'committeeName': instance.committeeName,
    };
