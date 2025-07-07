import 'package:campus_connect_frontend/models/profile_models.dart';

class ProfilePageState {}

class ProfilePageLoadingState extends ProfilePageState {}

class ProfilePageLoadedState extends ProfilePageState {
  String name;
  String email;
  String position;
  List<ProfileAnnouncements> announcements;
  List<ProfileEvents> events;

  ProfilePageLoadedState(
      {required this.name,
      required this.email,
      required this.position,
      required this.announcements,
      required this.events});
}

class ProfilePageErrorState extends ProfilePageState {
  String errorMessage;
  int statusCode;

  ProfilePageErrorState({required this.errorMessage, required this.statusCode});
}
