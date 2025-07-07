import 'package:campus_connect_frontend/models/announcement_model.dart';

class AnnouncementState {}

class AnnouncementLoadingState extends AnnouncementState {}

class AnnouncementLoadedState extends AnnouncementState {
  List<AnnouncementModel> announcements;

  AnnouncementLoadedState({required this.announcements});
}

class AnnouncementErrorState extends AnnouncementState {}
