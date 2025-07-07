import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  @JsonKey(name: '_id')
  String? id;
  String? name;
  String? emailId;
  List<CommitteeDetails>? committees;
  String? imageUrl;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  User({this.id, this.name, this.emailId, this.committees});

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class CommitteeDetails {
  String id;
  String? committeeName;
  String? position;
  String? logoUrl;

  factory CommitteeDetails.fromJson(Map<String, dynamic> json) =>
      _$CommitteeDetailsFromJson(json);

  CommitteeDetails(
      {required this.id, this.committeeName, this.position, this.logoUrl});

  Map<String, dynamic> toJson() => _$CommitteeDetailsToJson(this);
}
