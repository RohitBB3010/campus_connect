import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventViewDialog extends StatelessWidget {
  EventViewDialog({super.key, required this.event});
  EventModel event;

  String formatDateTime(DateTime dateTime) {
    return DateFormat("d MMM, yyyy hh:mma")
        .format(dateTime)
        .replaceFirst('AM', 'am')
        .replaceFirst('PM', 'pm');
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: ColorConsts().icons_bg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      insetPadding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.03,
        horizontal: MediaQuery.of(context).size.width * 0.025,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.03,
            horizontal: MediaQuery.of(context).size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: AutoSizeText(
                      event.eventName,
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: const TextStyle(
                          fontFamily: 'MinorkSemiBold', fontSize: 30.0),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.005,
                        horizontal: MediaQuery.of(context).size.width * 0.005),
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
                  )
                ],
              ),
              SpacingConsts().smallHeightBetweenFields(context),
              AutoSizeText(
                event.description,
                style: const TextStyle(fontFamily: 'Nunito', fontSize: 18.0),
              ),
              SpacingConsts().smallHeightBetweenFields(context),
              Row(
                children: [
                  const AutoSizeText("Event Timings : ",
                      style: TextStyle(
                          fontFamily: 'NunitoSemiBold', fontSize: 20.0)),
                  Expanded(
                    child: AutoSizeText(
                        '${formatDateTime(event.startTime)} - ${formatDateTime(event.endTime)}',
                        maxLines: 2,
                        style: const TextStyle(
                            fontFamily: 'Nunito', fontSize: 17.0)),
                  ),
                ],
              ),
              SpacingConsts().smallHeightBetweenFields(context),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AutoSizeText(
                    "Venue :",
                    style:
                        TextStyle(fontFamily: 'NunitoSemiBold', fontSize: 18.0),
                  ),
                  SpacingConsts().smallWidthBetweenFields(context),
                  Flexible(
                      child: AutoSizeText(
                    event.venue,
                    maxLines: 3,
                    style:
                        const TextStyle(fontFamily: 'Nunito', fontSize: 18.0),
                  ))
                ],
              ),
              SpacingConsts().smallHeightBetweenFields(context),
              const AutoSizeText(
                "Event Leads :",
                style: TextStyle(fontFamily: 'NunitoSemiBold', fontSize: 20.0),
              ),
              AutoSizeText(
                "1) ${event.head}(${event.headEmail})",
                maxLines: 1,
                style: const TextStyle(fontFamily: 'Nunito', fontSize: 20.0),
              ),
              AutoSizeText(
                "2) ${event.coHead}(${event.coHeadEmail})",
                maxLines: 1,
                style: const TextStyle(fontFamily: 'Nunito', fontSize: 20.0),
              ),
              SpacingConsts().smallHeightBetweenFields(context),
              Row(
                children: [
                  const AutoSizeText(
                    "Eligibility : ",
                    maxLines: 1,
                    style: const TextStyle(
                        fontFamily: 'NunitoSemiBold', fontSize: 20.0),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      event.eligibility,
                      maxLines: 2,
                      style:
                          const TextStyle(fontFamily: 'Nunito', fontSize: 20.0),
                    ),
                  ),
                ],
              ),
              SpacingConsts().smallHeightBetweenFields(context),
              if (event.images != null)
                SizedBox(
                  height: MediaQuery.of(context).size.height *
                      0.2, // 20% of screen height
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: event.images!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            'http://10.0.2.2:8000/${event.images![index]}',
                            width: MediaQuery.of(context).size.width *
                                0.3, // 30% of screen width
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
