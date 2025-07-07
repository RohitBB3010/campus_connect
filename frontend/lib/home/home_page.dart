import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/auth/auth_cubit.dart';
import 'package:campus_connect_frontend/auth/auth_state.dart';
import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/home/announcements/announcement_page.dart';
import 'package:campus_connect_frontend/home/events/event_page.dart';
import 'package:campus_connect_frontend/home/profile/profile_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  bool isLoading = true;
  bool isError = false;
  String? userName;
  String? imageUrl;

  Future<void> loadUserData() async {
    String email = FirebaseAuth.instance.currentUser!.email!;

    String uri =
        'http://10.0.2.2:8000/home/fetch-basic-user-data?userEmail=$email';

    final response = await http.get(Uri.parse(uri));
    final responseBody = jsonDecode(response.body);

    if (response.statusCode == 500) {
      setState(() {
        isError = true;
      });
    } else {
      setState(() {
        userName = responseBody['name'];
        imageUrl = 'http://10.0.2.2:8000/${responseBody['imageUrl']}';
        isLoading = false;
      });
      debugPrint(userName);
      debugPrint(imageUrl);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const LoadingPage();
    }

    if (isError) {
      return const AutoSizeText(
          "Some unexpected error occured. Please try again after some time");
    }

    if (!isLoading && !isError) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: ColorConsts().primary,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: ColorConsts().secondary_orange,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, -4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: BottomAppBar(
              height: MediaQuery.of(context).size.height * 0.07,
              color:
                  Colors.transparent, // Set to transparent to show the shadow
              shape: const CircularNotchedRectangle(),
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
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _pageController.jumpToPage(2);
                        });
                      },
                      iconSize: 30.0,
                      icon: Icon(
                        OMIcons.person,
                        color: (_pageController.hasClients
                                ? _pageController.page == 2.0
                                : _pageController.initialPage == 2)
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
            onPageChanged: (int) {
              debugPrint(_pageController.page.toString());
            },
            children: [
              EventsPage(
                userName: userName!,
                profileImage: imageUrl!,
              ),
              AnnouncementHomePage(
                  userName: userName!, profileImage: imageUrl!),
              BlocBuilder<AuthCubit, AuthState>(
                builder: (context, state) {
                  return const ProfilePage();
                },
              )
            ],
          ),
        ),
      );
    }

    return const AutoSizeText("Home");
  }
}
