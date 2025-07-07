// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnnouncementModel _$AnnouncementModelFromJson(Map<String, dynamic> json) =>
    AnnouncementModel(
      title: json['title'] as String?,
      content: json['content'] as String?,
      tag: json['tag'] as String?,
      visibility: json['visibility'] as String?,
      author: json['author'] as String?,
      committeeName: json['committeeName'] as String?,
      authorImage: json['authorImage'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AnnouncementModelToJson(AnnouncementModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'tag': instance.tag,
      'visibility': instance.visibility,
      'author': instance.author,
      'committeeName': instance.committeeName,
      'authorImage': instance.authorImage,
      'images': instance.images,
    };
