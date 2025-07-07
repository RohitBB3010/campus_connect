import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:campus_connect_frontend/committees/announcements/annoncement_state.dart';
import 'package:campus_connect_frontend/committees/announcements/announcement_cubit.dart';
import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/models/announcement_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementsPageComm extends StatelessWidget {
  AnnouncementsPageComm({super.key, required this.committeeId});
  String committeeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AnnouncementCubit()..fetchAnnouncements(committeeId),
      child: BlocBuilder<AnnouncementCubit, AnnouncementState>(
        builder: (context, state) {
          if (state is AnnouncementLoadingState) {
            return const LoadingPage();
          } else if (state is AnnouncementLoadedState) {
            debugPrint(state.announcements.length.toString());
            return SingleChildScrollView(
              child: Column(
                children: [
                  SpacingConsts().smallHeightBetweenFields(context),
                  const AutoSizeText(
                    'Announcements',
                    style:
                        TextStyle(fontFamily: 'MinorkSemiBold', fontSize: 30.0),
                  ),
                  if (state.announcements.isEmpty)
                    const Image(image: AssetImage('assets/empty_img.png')),
                  if (state.announcements.isEmpty)
                    const AutoSizeText(
                      'No announcmments',
                      style: TextStyle(fontFamily: 'Minork', fontSize: 25.0),
                    ),
                  Column(
                      children: state.announcements.map((announcement) {
                    return _buildAnnouncementCard(context, announcement);
                  }).toList()),
                ],
              ),
            );
          } else {
            return const AutoSizeText("Last case");
          }
        },
      ),
    );
  }

  Widget _buildAnnouncementCard(
      BuildContext context, AnnouncementModel announcement) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.02,
      ),
      width: MediaQuery.of(context).size.width * 0.85,
      child: Card(
        elevation: 2.0,
        color: ColorConsts().icons_bg,
        child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.01),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.08,
                          child: CircleAvatar(
                            //radius: MediaQuery.of(context).size.width * 0.1,
                            child: Image.network(
                                'http://10.0.2.2:8000/${announcement.authorImage}'),
                          ),
                        ),
                        SpacingConsts().smallWidthBetweenFields(context),
                        AutoSizeText(
                          announcement.author!,
                          style: const TextStyle(
                              fontFamily: "Nunito", fontSize: 18.0),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: ColorConsts().primary,
                          borderRadius: BorderRadius.circular(10.0)),
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.01,
                      ),
                      child: AutoSizeText(
                        announcement.tag!,
                        style: const TextStyle(fontFamily: 'Minork'),
                      ),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.05,
                      left: MediaQuery.of(context).size.width * 0.1),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AutoSizeText(announcement.title!,
                          style: const TextStyle(
                              fontFamily: 'MinorkSemiBold', fontSize: 20.0)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: AutoSizeText(announcement.content!,
                            style: const TextStyle(
                                fontFamily: "Nunito", fontSize: 18.0)),
                      ),
                      SpacingConsts().smallHeightBetweenFields(context),
                      if (announcement.images != null)
                        Wrap(
                          spacing: MediaQuery.of(context).size.width * 0.02,
                          children: announcement.images!.map((url) {
                            debugPrint(url);
                            return InkWell(
                              onTap: () {
                                showImageDialog(context, url);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            'http://10.0.2.2:8000/$url'),
                                        fit: BoxFit.cover)),
                              ),
                            );
                          }).toList(),
                        )
                    ],
                  ),
                ),
                SpacingConsts().smallHeightBetweenFields(context)
              ],
            )),
      ),
    );
  }

  void showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: FittedBox(
                fit: BoxFit.contain,
                child: Image.network('http://10.0.2.2:8000/$imageUrl')),
          );
        });
  }
}
