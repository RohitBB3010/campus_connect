// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      emailId: json['emailId'] as String?,
      committees: (json['committees'] as List<dynamic>?)
          ?.map((e) => CommitteeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    )..imageUrl = json['imageUrl'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'emailId': instance.emailId,
      'committees': instance.committees?.map((e) => e.toJson()).toList(),
      'imageUrl': instance.imageUrl,
    };

CommitteeDetails _$CommitteeDetailsFromJson(Map<String, dynamic> json) =>
    CommitteeDetails(
      id: json['id'] as String,
      committeeName: json['committeeName'] as String?,
      position: json['position'] as String?,
      logoUrl: json['logoUrl'] as String?,
    );

Map<String, dynamic> _$CommitteeDetailsToJson(CommitteeDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'committeeName': instance.committeeName,
      'position': instance.position,
      'logoUrl': instance.logoUrl,
    };
