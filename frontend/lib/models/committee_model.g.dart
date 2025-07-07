// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'committee_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommitteeModel _$CommitteeModelFromJson(Map<String, dynamic> json) =>
    CommitteeModel(
      committeeName: json['committeeName'] as String?,
      authorities: (json['authorities'] as List<dynamic>?)
          ?.map((e) => MemberDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      members: (json['members'] as List<dynamic>?)
          ?.map((e) => MemberDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      events:
          (json['events'] as List<dynamic>?)?.map((e) => e as String).toList(),
      announcements: (json['announcements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CommitteeModelToJson(CommitteeModel instance) =>
    <String, dynamic>{
      'committeeName': instance.committeeName,
      'authorities': instance.authorities?.map((e) => e.toJson()).toList(),
      'members': instance.members?.map((e) => e.toJson()).toList(),
      'events': instance.events,
      'announcements': instance.announcements,
    };

MemberDetails _$MemberDetailsFromJson(Map<String, dynamic> json) =>
    MemberDetails(
      name: json['name'] as String?,
      email: json['email'] as String?,
      position: json['position'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$MemberDetailsToJson(MemberDetails instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'position': instance.position,
      'imageUrl': instance.imageUrl,
    };
