import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/committees/announcements/announcements_page_comm.dart';
import 'package:campus_connect_frontend/committees/events/events_page_comm.dart';
import 'package:campus_connect_frontend/committees/members/members_page.dart';
import 'package:campus_connect_frontend/committees/profile/profile_page_comm.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/committees/add_announcement/announcement_add_page.dart';
import 'package:campus_connect_frontend/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class CommPage extends StatefulWidget {
  CommPage({super.key, required this.commDetails});
  CommitteeDetails commDetails;

  @override
  State<CommPage> createState() => _CommPageState();
}

class _CommPageState extends State<CommPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConsts().primary,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: ColorConsts().secondary_pink,
          shape: const CircleBorder(),
          onPressed: () {
            _buildAddDialog(context, widget.commDetails.id);
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 50.0,
          ),
        ),
        appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            titleSpacing: 0,
            backgroundColor: ColorConsts().primary,
            elevation: 0,
            title: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.06,
                    child: Image(
                        image: NetworkImage(
                            "http://10.0.2.2:8000/${widget.commDetails.logoUrl!}")),
                  ),
                  SpacingConsts().smallWidthBetweenFields(context),
                  Expanded(
                    child: AutoSizeText(
                        "Welcome to ${widget.commDetails.committeeName!}`s Corel page",
                        maxLines: 2,
                        style: const TextStyle(
                            fontFamily: "MinorkSemiBold", fontSize: 20.0)),
                  ),
                ],
              ),
            )),
        bottomNavigationBar: Padding(
          padding:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 6.0,
            height: MediaQuery.of(context).size.height * 0.07,
            color: ColorConsts().secondary_orange,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(0);
                      });
                    },
                    iconSize: 30.0,
                    icon: Icon(
                      OMIcons.eventAvailable,
                      color: (_pageController.hasClients
                              ? _pageController.page == 0.0
                              : _pageController.initialPage == 0)
                          ? ColorConsts().primary
                          : const Color(0xff2F3E46),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(1);
                      });
                    },
                    iconSize: 30.0,
                    icon: Icon(
                      OMIcons.calendarToday,
                      color: (_pageController.hasClients
                              ? _pageController.page == 1.0
                              : _pageController.initialPage == 1)
                          ? ColorConsts().primary
                          : const Color(0xff2F3E46),
                    ),
                  ),
                  SpacingConsts().largeWidthBetweenFields(context),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(2);
                      });
                    },
                    iconSize: 30.0,
                    icon: Icon(
                      OMIcons.group,
                      color: (_pageController.hasClients
                              ? _pageController.page == 2.0
                              : _pageController.initialPage == 2)
                          ? ColorConsts().primary
                          : const Color(0xff2F3E46),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _pageController.jumpToPage(3);
                      });
                    },
                    iconSize: 30.0,
                    icon: Icon(
                      OMIcons.person,
                      color: (_pageController.hasClients
                              ? _pageController.page == 3.0
                              : _pageController.initialPage == 3)
                          ? ColorConsts().primary
                          : const Color(0xff2F3E46),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: PageView(
          controller: _pageController,
          children: [
            AnnouncementsPageComm(committeeId: widget.commDetails.id),
            EventsPageComm(committeeId: widget.commDetails.id),
            MembersPage(committeeId: widget.commDetails.id),
            ProfilePageComm(committeeId: widget.commDetails.id)
          ],
        ),
      ),
    );
  }

  void _buildAddDialog(BuildContext context, String committeeId) {
    Navigator.of(context).push(MaterialPageRoute(
        //fullscreenDialog: true,
        builder: (BuildContext context) {
      return AnnouncementAddPage(
        committeeId: committeeId,
      );
    }));
  }
}
