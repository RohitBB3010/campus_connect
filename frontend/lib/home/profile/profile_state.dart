import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:file_picker/file_picker.dart';
import '../../models/user_model.dart';

part 'profile_state.g.dart';

class ProfileState {}

class ProfileLoadingState extends ProfileState {}

@CopyWith()
class ProfileLoadedState extends ProfileState {
  User? user;
  String? modName;
  String? modEmail;
  PlatformFile? image;

  ProfileLoadedState(
      {required this.user, this.modName, this.modEmail, this.image});
}

class ProfileErrorState extends ProfileState {
  String error;

  ProfileErrorState({required this.error});
}
