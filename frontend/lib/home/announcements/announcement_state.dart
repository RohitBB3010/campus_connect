import 'package:campus_connect_frontend/models/announcement_model.dart';

class AnnouncementHomeState {}

class AnnouncementHomeLoadingState extends AnnouncementHomeState {}

class AnnouncementHomeLoadedState extends AnnouncementHomeState {
  List<AnnouncementModel> announcements;

  AnnouncementHomeLoadedState({required this.announcements});
}

class AnnouncementHomeErrorState extends AnnouncementHomeState {}
