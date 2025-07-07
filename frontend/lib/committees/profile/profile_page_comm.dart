import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/committees/profile/profile_page_cubit.dart';
import 'package:campus_connect_frontend/committees/profile/profile_page_state.dart';
import 'package:campus_connect_frontend/components/error_page.dart';
import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/models/profile_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ProfilePageComm extends StatelessWidget {
  ProfilePageComm({super.key, required this.committeeId});
  String committeeId;

  String formatDateTime(DateTime dateTime) {
    return DateFormat("d MMM, yyyy hh:mma")
        .format(dateTime)
        .replaceFirst('AM', 'am')
        .replaceFirst('PM', 'pm');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProfilePageCubit()..fetchComitteeProfilePageData(committeeId),
      child: BlocBuilder<ProfilePageCubit, ProfilePageState>(
        builder: (context, state) {
          if (state is ProfilePageLoadingState) {
            return const LoadingPage();
          } else if (state is ProfilePageLoadedState) {
            return Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.07,
                  vertical: MediaQuery.of(context).size.width * 0.05),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpacingConsts().smallHeightBetweenFields(context),
                    buildInfoCard(context, "Name ", state.name),
                    SpacingConsts().smallHeightBetweenFields(context),
                    buildInfoCard(context, "Email ", state.email),
                    SpacingConsts().smallHeightBetweenFields(context),
                    buildInfoCard(context, "Position ", state.position),
                    SpacingConsts().smallHeightBetweenFields(context),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    SpacingConsts().smallHeightBetweenFields(context),
                    AutoSizeText(
                      "Your Events (${state.events.length})",
                      maxLines: 1,
                      style: const TextStyle(
                          fontFamily: 'NunitoSemiBold', fontSize: 30),
                    ),
                    if (state.events.isEmpty)
                      const AutoSizeText(
                        "Events where you are head or co-head will appear here",
                        maxLines: 1,
                        style: TextStyle(fontFamily: 'Nunito', fontSize: 20),
                      ),
                    if (state.events.isNotEmpty)
                      Column(
                          children: state.events.map((event) {
                        return buildEventCard(context, event);
                      }).toList()),
                    SpacingConsts().smallHeightBetweenFields(context),
                    const Divider(
                      thickness: 1,
                      color: Colors.black,
                    ),
                    SpacingConsts().smallHeightBetweenFields(context),
                    const AutoSizeText(
                      "Your Announcements",
                      maxLines: 1,
                      style:
                          TextStyle(fontFamily: 'MinorkSemiBold', fontSize: 30),
                    ),
                    if (state.announcements.isEmpty)
                      const AutoSizeText(
                        "Announcements added by you will appear here",
                        maxLines: 1,
                        style: TextStyle(fontFamily: 'Nunito', fontSize: 20),
                      ),
                    if (state.announcements.isNotEmpty)
                      Column(
                          children: state.announcements.map((announcement) {
                        return buildAnnouncementCard(context, announcement);
                      }).toList()),
                  ],
                ),
              ),
            );
          } else if (state is ProfilePageErrorState) {
            return ErrorPage(
                errorMessage: state.errorMessage, statusCode: state.statusCode);
          }

          return const AutoSizeText("Last resort");
        },
      ),
    );
  }

  Widget buildInfoCard(BuildContext context, String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(title,
            maxLines: 1,
            style: const TextStyle(fontFamily: 'NunitoSemiBold', fontSize: 25)),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.02,
              vertical: MediaQuery.of(context).size.width * 0.01),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black.withOpacity(0.2))),
          child: AutoSizeText(text,
              maxLines: 1,
              style: const TextStyle(fontFamily: 'Nunito', fontSize: 25)),
        ),
      ],
    );
  }

  Widget buildEventCard(BuildContext context, ProfileEvents event) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.width * 0.01),
      decoration: BoxDecoration(
          color: ColorConsts().icons_bg,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                event.title,
                maxLines: 1,
                style: const TextStyle(fontFamily: 'Minork', fontSize: 20),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
          AutoSizeText(
              '${formatDateTime(event.startDate)} - ${formatDateTime(event.endDate)}',
              maxLines: 1,
              style: const TextStyle(fontFamily: 'Nunito', fontSize: 20))
        ],
      ),
    );
  }

  Widget buildAnnouncementCard(
      BuildContext context, ProfileAnnouncements announcement) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      margin:
          EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.02,
          vertical: MediaQuery.of(context).size.width * 0.01),
      decoration: BoxDecoration(
          color: ColorConsts().icons_bg,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                announcement.title,
                maxLines: 1,
                style: const TextStyle(fontFamily: 'Minork', fontSize: 20),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
