import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/components/event_card.dart';
import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/components/text_field.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/home/events/event_cubit.dart';
import 'package:campus_connect_frontend/home/events/event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsPage extends StatelessWidget {
  EventsPage({super.key, required this.userName, required this.profileImage});
  String userName;
  String profileImage;

  List<String> committeeNames = [
    'Computer Society Of India',
    'Student Council',
    'Association of Computer Machinery',
    'Google Developers Student\'s Club',
    'Unstop Igniters Club'
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventCubit()..fetchEventsData(),
      child: BlocBuilder<EventCubit, EventState>(builder: (context, state) {
        if (state is EventLoadingState) {
          return const LoadingPage();
        } else if (state is EventLoadedState) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height * 0.08,
              title: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.01),
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
            body: Padding(
              padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
                horizontal: MediaQuery.of(context).size.width * 0.025,
              ),
              child: Column(
                children: [
                  const AutoSizeText("Events",
                      style: TextStyle(
                          fontFamily: 'MinorkSemiBold', fontSize: 35)),
                  SpacingConsts().smallHeightBetweenFields(context),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextField(
                          fieldHeight: 0.05,
                          fieldWidth: 0.8,
                          hintText: "Search by event name",
                          onChanged: (value) {
                            context.read<EventCubit>().filterValueChanged(
                                state.events,
                                value,
                                state.filterCommitteeName!);
                          },
                        ),
                        SpacingConsts().smallHeightBetweenFields(context),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: DropdownButton(
                                  isExpanded: true,
                                  items: committeeNames.map((committeeName) {
                                    return DropdownMenuItem(
                                      value: committeeName,
                                      child: AutoSizeText(
                                        committeeName,
                                        maxLines: 1,
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    );
                                  }).toList(),
                                  value: state.filterCommitteeName,
                                  onChanged: (value) {
                                    context
                                        .read<EventCubit>()
                                        .filterValueChanged(state.events,
                                            state.searchEventName, value!);
                                  }),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                              child: IconButton(
                                  onPressed: () {
                                    context
                                        .read<EventCubit>()
                                        .committeeFilterRemoved(
                                            state.searchEventName,
                                            state.events);
                                  },
                                  icon: const Icon(Icons.close)),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  if (state.displayEvents.isEmpty)
                    Image.asset('assets/empty_img.png'),
                  if (state.displayEvents.isEmpty)
                    const AutoSizeText("No events scheduled",
                        style: TextStyle(fontFamily: 'Minork', fontSize: 25)),
                  if (state.displayEvents.isNotEmpty)
                    Expanded(
                      child: ListView(
                        children: state.displayEvents.map((event) {
                          return EventCard(event: event, isHome: true);
                        }).toList(),
                      ),
                    ),
                ],
              ),
            ),
          );
        } else if (state is EventErrorState) {
          return Center(child: AutoSizeText(state.error));
        }
        return const AutoSizeText('Last resort case');
      }),
    );
  }
}
