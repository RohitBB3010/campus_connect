import 'package:json_annotation/json_annotation.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel {
  String eventName;
  String description;
  String committeeId;
  String venue;
  String tag;
  String? registrationLink;
  DateTime startTime;
  DateTime endTime;
  List<String>? images;
  String eligibility;
  String head;
  String coHead;
  String headEmail;
  String coHeadEmail;
  String? committeeName;

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);

  EventModel(
      {required this.eventName,
      required this.description,
      required this.committeeId,
      required this.venue,
      required this.tag,
      this.registrationLink,
      required this.startTime,
      required this.endTime,
      this.images,
      required this.eligibility,
      required this.head,
      required this.coHead,
      required this.headEmail,
      required this.coHeadEmail,
      this.committeeName});

  Map<String, dynamic> toJson() => _$EventModelToJson(this);
}
