import 'package:campus_connect_frontend/models/committee_model.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

part 'add_event_state.g.dart';

@CopyWith()
class AddEventState {
  String? eventName;
  String? description;
  String? tag;
  String? venue;
  DateTime? startTime;
  DateTime? endTime;
  String? registrationLink;
  String? eligibility;
  MemberDetails? head;
  MemberDetails? coHead;
  List<MemberDetails>? members;
  List<ImageFile>? images;

  AddEventState(
      {this.eventName,
      this.description,
      this.tag,
      this.venue,
      this.startTime,
      this.endTime,
      this.registrationLink,
      this.eligibility,
      this.head,
      this.coHead,
      this.members,
      this.images});
}
