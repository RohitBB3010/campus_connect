import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/components/event_view_dialog.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventCard extends StatelessWidget {
  EventCard({super.key, required this.event, required this.isHome});
  EventModel event;
  bool isHome;

  String formatDateTime(DateTime dateTime) {
    return DateFormat("d MMM, yyyy hh:mma")
        .format(dateTime)
        .replaceFirst('AM', 'am')
        .replaceFirst('PM', 'pm');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.2,
            child: Column(
              children: [
                AutoSizeText(formatDateTime(event.startTime).split(' ').first,
                    maxLines: 1,
                    style: const TextStyle(
                        fontFamily: 'NunitoSemiBold', fontSize: 80.0)),
                AutoSizeText(
                    '${formatDateTime(event.startTime).split(' ')[1]} ${formatDateTime(event.startTime).split(' ')[2]}',
                    maxLines: 1,
                    style: const TextStyle(
                        fontFamily: 'NunitoSemiBold', fontSize: 60.0))
              ],
            )),
        SpacingConsts().customWidthBetweenFields(context, 0.01),
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return EventViewDialog(event: event);
                  });
            },
            child: Card(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.72,
                padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                  horizontal: MediaQuery.of(context).size.width * 0.02,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: ColorConsts().icons_bg),
                child: Column(
                  children: [
                    AutoSizeText(
                      event.eventName,
                      maxLines: 1,
                      style: const TextStyle(
                          fontFamily: 'MinorkSemiBold',
                          fontSize: 30.0,
                          overflow: TextOverflow.ellipsis),
                    ),
                    if (isHome)
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical:
                                MediaQuery.of(context).size.height * 0.005,
                            horizontal:
                                MediaQuery.of(context).size.width * 0.01),
                        margin: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.005,
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(17),
                            color: Colors.teal),
                        child: AutoSizeText(event.committeeName!,
                            style: const TextStyle(
                                fontFamily: 'Minork', color: Colors.white)),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.005,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.005),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: ColorConsts().secondary_pink),
                          child: AutoSizeText(
                            event.tag,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            style: const TextStyle(
                                fontFamily: 'Minork',
                                fontSize: 17.0,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(
                              maxWidth:
                                  MediaQuery.of(context).size.width * 0.35),
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.005,
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.02),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: ColorConsts().secondary_pink),
                          child: AutoSizeText(
                            event.eligibility,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                                fontFamily: 'Minork',
                                fontSize: 17.0,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                    SpacingConsts().smallHeightBetweenFields(context),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AutoSizeText(
                          "Venue :",
                          style: TextStyle(
                              fontFamily: 'NunitoSemiBold', fontSize: 18.0),
                        ),
                        Flexible(
                            child: AutoSizeText(
                          event.venue,
                          maxLines: 3,
                          style: const TextStyle(
                              fontFamily: 'Nunito', fontSize: 18.0),
                        ))
                      ],
                    ),
                    Row(
                      children: [
                        const AutoSizeText("Timings : ",
                            style: TextStyle(
                                fontFamily: 'NunitoSemiBold', fontSize: 18.0)),
                        Expanded(
                          child: AutoSizeText(
                              '${formatDateTime(event.startTime)} - ${formatDateTime(event.endTime)}',
                              maxLines: 2,
                              style: const TextStyle(
                                  fontFamily: 'Nunito', fontSize: 17.0)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
