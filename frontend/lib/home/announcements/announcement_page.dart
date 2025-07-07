import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/components/announcement_card.dart';
import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/home/announcements/announcement_cubit.dart';
import 'package:campus_connect_frontend/home/announcements/announcement_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementHomePage extends StatelessWidget {
  AnnouncementHomePage(
      {super.key, required this.userName, required this.profileImage});
  String userName;
  String profileImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnnouncementHomeCubit()..fetchHomeAnnouncements(),
      child: BlocBuilder<AnnouncementHomeCubit, AnnouncementHomeState>(
        builder: (context, state) {
          if (state is AnnouncementHomeLoadingState) {
            return const LoadingPage();
          } else if (state is AnnouncementHomeErrorState) {
          } else if (state is AnnouncementHomeLoadedState) {
            return Scaffold(
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height * 0.08,
                title: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.02,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.12,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: Image(
                            image: NetworkImage(profileImage),
                            fit: BoxFit.contain,
                          )),
                      SpacingConsts().smallWidthBetweenFields(context),
                      AutoSizeText(userName,
                          style: const TextStyle(
                              fontFamily: 'MinorkSemiBold', fontSize: 25)),
                    ],
                  ),
                ),
              ),
              body: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    SpacingConsts().mediumHeightBetweenFields(context),
                    if (state.announcements.isEmpty)
                      const Image(image: AssetImage('assets/empty_img.png')),
                    if (state.announcements.isEmpty)
                      const AutoSizeText('No announcements',
                          style:
                              TextStyle(fontFamily: 'Minork', fontSize: 30.0)),
                    if (state.announcements.isNotEmpty)
                      Expanded(
                        child: ListView(
                          children: state.announcements.map((announcement) {
                            return AnnouncementCard(
                                announcement: announcement, isHome: true);
                          }).toList(),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }

          return const AutoSizeText("Last resort case");
        },
      ),
    );
  }
}
