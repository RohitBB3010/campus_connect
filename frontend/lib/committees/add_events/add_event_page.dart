import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/committees/add_events/add_event_cubit.dart';
import 'package:campus_connect_frontend/committees/add_events/add_event_state.dart';
import 'package:campus_connect_frontend/components/custom_button.dart';
import 'package:campus_connect_frontend/components/text_field.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/models/committee_model.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker_view/multi_image_picker_view.dart';

class AddEventsPage extends StatelessWidget {
  AddEventsPage({super.key, required this.committeeId});
  String committeeId;

  String formatDateTime(DateTime dateTime) {
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy HH:mm');
    return dateFormat.format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const AutoSizeText(
            "Add Event",
            style: TextStyle(fontFamily: "Minork", fontSize: 30.0),
          ),
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
          create: (context) => AddEventCubit()..fetchMembers(committeeId),
          child: BlocBuilder<AddEventCubit, AddEventState>(
              builder: (context, state) {
            final controller = MultiImagePickerController(
              images: state.images,
              picker: (allowMultiple) async {
                final result = await FilePicker.platform.pickFiles(
                    type: FileType.custom,
                    allowedExtensions: ['jpeg', 'jpg', 'png'],
                    withData: true,
                    allowMultiple: true);

                if (result != null) {
                  final imageFiles = result.files
                      .map((e) => convertPlatformFileToImageFile(e))
                      .toList();

                  context.read<AddEventCubit>().imageAdded(imageFiles);
                }
                return [];
              },
            );

            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.07),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpacingConsts().smallHeightBetweenFields(context),
                    buildCustomField("Event Name",
                        context.read<AddEventCubit>().eventNameChanged),
                    SpacingConsts().smallHeightBetweenFields(context),
                    buildCustomField("Event Description",
                        context.read<AddEventCubit>().descriptionChanged),
                    SpacingConsts().smallHeightBetweenFields(context),
                    buildMemberDropDown(
                        "Event Head",
                        context,
                        state.head,
                        state.members
                            ?.where((member) => member != state.coHead)
                            .toList(),
                        context.read<AddEventCubit>().headChanged),
                    SpacingConsts().smallHeightBetweenFields(context),
                    buildMemberDropDown(
                        "Event Co-Head",
                        context,
                        state.coHead,
                        state.members
                            ?.where((member) => member != state.head)
                            .toList(),
                        context.read<AddEventCubit>().coHeadChanged),
                    SpacingConsts().smallHeightBetweenFields(context),
                    const AutoSizeText("Event Timing",
                        style: TextStyle(fontFamily: "Nunito", fontSize: 20.0)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );

                            if (pickedDate != null) {
                              // Step 2: Pick a time
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                              if (pickedTime != null) {
                                // Combine the date and time
                                final DateTime finalDateTime = DateTime(
                                  pickedDate.year,
                                  pickedDate.month,
                                  pickedDate.day,
                                  pickedTime.hour,
                                  pickedTime.minute,
                                );
                                context
                                    .read<AddEventCubit>()
                                    .startTimeChanged(finalDateTime);
                              }
                            }
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.32,
                            child: AutoSizeText(
                              state.startTime == null
                                  ? 'Start Time'
                                  : formatDateTime(state.startTime!),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  fontFamily: 'Nunito',
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.07,
                          child: const Icon(Icons.arrow_forward, size: 20.0),
                        ),
                        InkWell(
                          onTap: () async {
                            final DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );

                            if (pickedDate != null) {
                              // Step 2: Pick a time
                              final TimeOfDay? pickedTime =
                                  await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );

                              if (pickedTime != null) {
                                // Combine the date and time
                                final DateTime finalDateTime = DateTime(
                                  pickedDate.year,
                                  pickedDate.month,
                                  pickedDate.day,
                                  pickedTime.hour,
                                  pickedTime.minute,
                                );
                                context
                                    .read<AddEventCubit>()
                                    .endTimeChanged(finalDateTime);
                              }
                            }
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.32,
                            child: AutoSizeText(
                              state.endTime == null
                                  ? 'End Time'
                                  : formatDateTime(state.endTime!),
                              maxLines: 1,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2,
                                  fontFamily: 'Nunito',
                                  fontSize: 18),
                            ),
                          ),
                        )
                      ],
                    ),
                    SpacingConsts().smallHeightBetweenFields(context),
                    const AutoSizeText("Event Posters And Images",
                        style: TextStyle(fontFamily: 'Nunito', fontSize: 20.0)),
                    MultiImagePickerView(
                      controller: controller,
                      draggable: true,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                      .read<AddEventCubit>()
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
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .primary
                            .withOpacity(0.2),
                      ),
                    ),
                    SpacingConsts().smallHeightBetweenFields(context),
                    buildCustomField("Add Venue",
                        context.read<AddEventCubit>().venueChanged),
                    SpacingConsts().smallHeightBetweenFields(context),
                    tagDropDown(context, state.tag),
                    SpacingConsts().smallHeightBetweenFields(context),
                    buildCustomField(
                        "Event Attendees Elgibility(e.g, 'Open to all', 'CS dept. only)",
                        context.read<AddEventCubit>().eligibilityChanged),
                    SpacingConsts().smallHeightBetweenFields(context),
                    buildCustomField("Event Registration Link",
                        context.read<AddEventCubit>().registrationLinkChanged),
                    SpacingConsts().mediumHeightBetweenFields(context),
                    Center(
                      child: CustomButton(
                          context, "Add Event", ColorConsts().secondary_pink,
                          () async {
                        final cubit = context.read<AddEventCubit>();
                        if (cubit.state.eventName == null ||
                            cubit.state.eventName!.isEmpty ||
                            cubit.state.description == null ||
                            cubit.state.description!.isEmpty ||
                            cubit.state.head == null ||
                            cubit.state.coHead == null ||
                            cubit.state.startTime == null ||
                            cubit.state.endTime == null ||
                            cubit.state.venue == null ||
                            cubit.state.venue!.isEmpty ||
                            cubit.state.tag == null ||
                            cubit.state.tag!.isEmpty ||
                            cubit.state.eligibility == null ||
                            cubit.state.eligibility!.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                "Please fill all the required fields!",
                                style: TextStyle(fontFamily: "Nunito"),
                              ),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 2),
                            ),
                          );
                        } else {
                          bool result = await context
                              .read<AddEventCubit>()
                              .addEvent(
                                  state.eventName!,
                                  state.description!,
                                  state.tag!,
                                  state.venue!,
                                  state.startTime!,
                                  state.endTime!,
                                  state.images,
                                  state.head!,
                                  committeeId,
                                  state.coHead!,
                                  state.registrationLink,
                                  state.eligibility!);

                          if (result) {
                            Navigator.pop(context);
                          }
                        }
                      }, 0.8, 0.06, 20),
                    ),
                    SpacingConsts().mediumHeightBetweenFields(context)
                  ],
                ),
              ),
            );
          }),
        ));
  }

  Widget buildCustomField(String text, void Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(text,
            maxLines: 1,
            style: const TextStyle(fontFamily: 'Nunito', fontSize: 20.0)),
        CustomTextField(
          fieldHeight: 0.05,
          fieldWidth: 0.85,
          onChanged: onChanged,
        )
      ],
    );
  }

  Widget buildMemberDropDown(
      String text,
      BuildContext context,
      MemberDetails? selectedMember,
      List<MemberDetails>? members,
      void Function(MemberDetails) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          text,
          textAlign: TextAlign.start,
          style: const TextStyle(fontFamily: "Nunito", fontSize: 20.0),
        ),
        DropdownButtonFormField2<MemberDetails>(
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            filled: true,
            fillColor: ColorConsts().icons_bg, // Set background color
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
          value: selectedMember, // Will be null if no value is selected
          items: members != null && members.isNotEmpty
              ? members.map((member) {
                  return DropdownMenuItem<MemberDetails>(
                    value: member,
                    child: AutoSizeText(
                      '${member.name} (${member.position})',
                      style: const TextStyle(fontFamily: 'Nunito'),
                    ),
                  );
                }).toList()
              : null, // Ensure dropdown has no items if members list is empty
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
          hint: const AutoSizeText(
            'Select a Member', // Placeholder when no value is selected
            style: TextStyle(fontFamily: 'Nunito', fontSize: 16.0),
          ),
          isExpanded: true,
        )
      ],
    );
  }

  Widget tagDropDown(BuildContext context, String? selectedTag) {
    List<String> tags = [
      "Workshop",
      "Competition",
      "Cultural",
      "Professional",
      "Awareness",
      "Tech",
      "Networking",
      "Meeting"
    ];

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
              context.read<AddEventCubit>().tagChanged(value!);
            })
      ],
    );
  }
}
