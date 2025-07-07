import 'package:json_annotation/json_annotation.dart';

part 'announcement_model.g.dart';

@JsonSerializable()
class AnnouncementModel {
  String? title;
  String? content;
  String? tag;
  String? visibility;
  String? author;
  String? committeeName;
  String? authorImage;
  List<String>? images;

  factory AnnouncementModel.fromJson(Map<String, dynamic> json) =>
      _$AnnouncementModelFromJson(json);

  AnnouncementModel(
      {this.title,
      this.content,
      this.tag,
      this.visibility,
      this.author,
      this.committeeName,
      this.authorImage,
      this.images});

  Map<String, dynamic> toJson() => _$AnnouncementModelToJson(this);
}
