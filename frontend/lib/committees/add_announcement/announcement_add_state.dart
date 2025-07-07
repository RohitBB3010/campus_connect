import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

part 'announcement_add_state.g.dart';

@CopyWith()
class AnnouncementAddState {
  String? title;
  String? content;
  List<ImageFile>? imageUrl;
  String? tag;
  String visibility;
  int isSelected;

  AnnouncementAddState(
      {this.title,
      this.content,
      this.imageUrl,
      this.tag,
      this.visibility = "All",
      this.isSelected = 0});
}
