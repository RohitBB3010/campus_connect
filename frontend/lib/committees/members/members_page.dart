import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/committees/members/members_cubit.dart';
import 'package:campus_connect_frontend/committees/members/members_state.dart';
import 'package:campus_connect_frontend/components/error_page.dart';
import 'package:campus_connect_frontend/components/loading_page.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:campus_connect_frontend/models/committee_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MembersPage extends StatelessWidget {
  MembersPage({super.key, required this.committeeId});
  String committeeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MembersCubit()..fetchMembers(committeeId),
      child: BlocBuilder<MembersCubit, MembersState>(
        builder: (context, state) {
          debugPrint(state.toString());
          if (state is MembersLoadingState) {
            return const LoadingPage();
          } else if (state is MembersLoadedState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SpacingConsts().smallHeightBetweenFields(context),
                  const AutoSizeText(
                    "Committee Members",
                    textAlign: TextAlign.start,
                    style:
                        TextStyle(fontFamily: "MinorkSemiBold", fontSize: 30.0),
                  ),
                  SpacingConsts().smallHeightBetweenFields(context),
                  Column(
                    children: state.members.map((member) {
                      return buildMemberCard(context, member);
                    }).toList(),
                  ),
                ],
              ),
            );
          } else if (state is MembersErrorState) {
            return ErrorPage(
                errorMessage: state.errorMessage, statusCode: state.statusCode);
          }

          return const AutoSizeText("Last resort");
        },
      ),
    );
  }

  Widget buildMemberCard(BuildContext context, MemberDetails member) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height * 0.01,
      ),
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: ColorConsts().icons_bg,
        elevation: 3.0,
        child: ListTile(
          leading: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.1,
            child: Image.network("http://10.0.2.2:8000/${member.imageUrl!}"),
          ),
          title: AutoSizeText(
            member.name!,
            maxLines: 1,
            style: const TextStyle(fontFamily: 'Nunito', fontSize: 25.0),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                member.position!,
                maxLines: 1,
                style: const TextStyle(fontFamily: 'Nunito', fontSize: 17.0),
              ),
              AutoSizeText(
                member.email!,
                maxLines: 1,
                style: const TextStyle(fontFamily: 'Nunito', fontSize: 17.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
