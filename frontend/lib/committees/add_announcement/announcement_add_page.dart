import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/committees/add_announcement/announcement_add_cubit.dart';
import 'package:campus_connect_frontend/committees/add_announcement/announcement_add_state.dart';
import 'package:campus_connect_frontend/components/custom_button.dart';
import 'package:campus_connect_frontend/components/text_field.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class AnnouncementAddPage extends StatelessWidget {
  AnnouncementAddPage({super.key, required this.committeeId});
  String committeeId;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: const AutoSizeText("Add Announcement",
                  style: TextStyle(fontFamily: "Minork", fontSize: 30.0)),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                      size: 35.0,
                    ))
              ],
            ),
            body: BlocProvider(
              create: (context) => AnnouncementAddCubit(),
              child: BlocBuilder<AnnouncementAddCubit, AnnouncementAddState>(
                builder: (context, state) {
                  final controller = MultiImagePickerController(
                    images: state.imageUrl,
                    picker: (allowMultiple) async {
                      final result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpeg', 'png', 'jpg'],
                          allowMultiple: true,
                          withData: true);

                      if (result != null) {
                        final imageFiles = result.files
                            .map((e) => convertPlatformFileToImageFile(e))
                            .toList();

                        // ignore: use_build_context_synchronously
                        context
                            .read<AnnouncementAddCubit>()
                            .imageAdded(imageFiles.toList());
                      }
                      return [];
                    },
                  );

                  return Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.08),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SpacingConsts().smallHeightBetweenFields(context),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText(
                                "Title",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "Minork", fontSize: 25.0),
                              ),
                              CustomTextField(
                                  fieldHeight: 0.07,
                                  fieldWidth: 0.8,
                                  onChanged: context
                                      .read<AnnouncementAddCubit>()
                                      .titleChanged),
                              SpacingConsts().smallHeightBetweenFields(context),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AutoSizeText(
                                "Content",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontFamily: "Minork", fontSize: 25.0),
                              ),
                              CustomTextField(
                                fieldHeight: 0.12,
                                fieldWidth: 0.8,
                                onChanged: context
                                    .read<AnnouncementAddCubit>()
                                    .contentChanged,
                                minLines: 4,
                                multiLine: true,
                              ),
                              SpacingConsts().smallHeightBetweenFields(context),
                              buildVisibilityTags(context, state.isSelected),
                              SpacingConsts().smallHeightBetweenFields(context),
                              tagDropDown(context, state.tag),
                              SpacingConsts().smallHeightBetweenFields(context),
                              buildImagePicker(context, controller),
                              SpacingConsts()
                                  .mediumHeightBetweenFields(context),
                              Center(
                                child: CustomButton(context, "Submit",
                                    ColorConsts().secondary_orange, () async {
                                  debugPrint(state.title);
                                  if (state.title == null ||
                                      state.title!.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            behavior: SnackBarBehavior.floating,
                                            backgroundColor:
                                                ColorConsts().secondary_pink,
                                            content: const AutoSizeText(
                                                "Title is mandatory field",
                                                style: TextStyle(
                                                    fontFamily: 'Nunito',
                                                    fontSize: 20))));
                                  } else {
                                    bool result = await context
                                        .read<AnnouncementAddCubit>()
                                        .addAnnouncement(
                                            context,
                                            state.title!,
                                            state.content,
                                            state.tag,
                                            state.visibility,
                                            committeeId,
                                            state.imageUrl);

                                    if (result) {
                                      Navigator.pop(context);
                                    }
                                  }
                                }, 0.8, 0.07, 20),
                              ),
                              SpacingConsts().mediumHeightBetweenFields(context)
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            )));
  }

  Widget buildVisibilityTags(BuildContext context, int isSelected) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Visibility",
          textAlign: TextAlign.start,
          style: TextStyle(fontFamily: "Minork", fontSize: 25.0),
        ),
        SpacingConsts().smallHeightBetweenFields(context),
        Center(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.065,
                decoration: BoxDecoration(
                    color: ColorConsts().icons_bg,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        context
                            .read<AnnouncementAddCubit>()
                            .isSelectedChanged(0);
                      },
                      child: Card(
                        elevation: isSelected == 0 ? 3.0 : 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: MediaQuery.of(context).size.height * 0.055,
                          decoration: BoxDecoration(
                              color: isSelected == 0
                                  ? Colors.white
                                  : ColorConsts().icons_bg,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: const Center(
                            child: AutoSizeText(
                              "All",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<AnnouncementAddCubit>()
                            .isSelectedChanged(1);
                      },
                      child: Card(
                        elevation: isSelected == 1 ? 3.0 : 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: MediaQuery.of(context).size.height * 0.055,
                          decoration: BoxDecoration(
                              color: isSelected == 1
                                  ? Colors.white
                                  : ColorConsts().icons_bg,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: const Center(
                            child: AutoSizeText(
                              "Members",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context
                            .read<AnnouncementAddCubit>()
                            .isSelectedChanged(2);
                      },
                      child: Card(
                        elevation: isSelected == 2 ? 3.0 : 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.24,
                          height: MediaQuery.of(context).size.height * 0.055,
                          decoration: BoxDecoration(
                              color: isSelected == 2
                                  ? Colors.white
                                  : ColorConsts().icons_bg,
                              borderRadius: BorderRadius.circular(12.0)),
                          child: const Center(
                            child: AutoSizeText(
                              "Members + Extended",
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget tagDropDown(BuildContext context, String? selectedTag) {
    List<String> tags = [
      "Event",
      "Important",
      "Urgent",
      "Meeting",
      "Update",
      "Casual",
      "Achievement",
      "Feedback"
    ];

    selectedTag = selectedTag ?? tags[0];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Tag",
          textAlign: TextAlign.start,
          style: TextStyle(fontFamily: "Minork", fontSize: 26.0),
        ),
        SpacingConsts().smallHeightBetweenFields(context),
        DropdownButtonFormField2(
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              filled: true,
              fillColor: ColorConsts().icons_bg,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Colors.grey.shade300,
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2.0,
                ),
              ),
            ),
            value: selectedTag,
            items: tags.map((tag) {
              return DropdownMenuItem(
                value: tag,
                child: AutoSizeText(
                  tag,
                  style: const TextStyle(fontFamily: 'Nunito'),
                ),
              );
            }).toList(),
            onChanged: (value) {
              context.read<AnnouncementAddCubit>().tagChanged(value!);
            })
      ],
    );
  }

  Widget buildImagePicker(
      BuildContext context, MultiImagePickerController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AutoSizeText(
          "Images",
          style: TextStyle(fontFamily: "Minork", fontSize: 26.0),
        ),
        SpacingConsts().smallHeightBetweenFields(context),
        MultiImagePickerView(
          controller: controller,
          draggable: true,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          padding: const EdgeInsets.all(8.0),
          onDragBoxDecoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(8.0),
          ),
          builder: (BuildContext context, ImageFile imageFile) {
            return Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: MemoryImage(imageFile.bytes!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: GestureDetector(
                    onTap: () {
                      // Remove the specific image from the state
                      context
                          .read<AnnouncementAddCubit>()
                          .removeImage(imageFile);
                    },
                    child: const Icon(
                      Icons.close,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ],
            );
          },
          initialWidget: DefaultInitialWidget(
            centerWidget: Icon(
              Icons.add_photo_alternate,
              color: Theme.of(context).colorScheme.primary,
              size: 50,
            ),
            backgroundColor: Colors.grey.shade200,
          ),
          addMoreButton: DefaultAddMoreWidget(
            icon: const Icon(Icons.add_a_photo),
            backgroundColor:
                Theme.of(context).colorScheme.primary.withOpacity(0.2),
          ),
        ),
      ],
    );
  }
}
