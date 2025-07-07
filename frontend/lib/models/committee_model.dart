import 'package:json_annotation/json_annotation.dart';

part 'committee_model.g.dart';

@JsonSerializable(explicitToJson: true)
class CommitteeModel {
  String? committeeName;
  List<MemberDetails>? authorities;
  List<MemberDetails>? members;
  List<String>? events;
  List<String>? announcements;

  CommitteeModel(
      {this.committeeName,
      this.authorities,
      this.members,
      this.events,
      this.announcements});
}

@JsonSerializable()
class MemberDetails {
  String? name;
  String? email;
  String? position;
  String? imageUrl;

  factory MemberDetails.fromJson(Map<String, dynamic> json) =>
      _$MemberDetailsFromJson(json);

  MemberDetails({this.name, this.email, this.position, this.imageUrl});

  Map<String, dynamic> toJson() => _$MemberDetailsToJson(this);
}
