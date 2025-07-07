import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/constants/spacing_consts.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  ErrorPage({super.key, required this.errorMessage, required this.statusCode});
  String errorMessage;
  int statusCode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/error.gif"), fit: BoxFit.contain)),
        ),
        AutoSizeText(statusCode.toString(),
            style:
                const TextStyle(fontFamily: 'NunitoSemiBold', fontSize: 30.0)),
        SpacingConsts().smallHeightBetweenFields(context),
        AutoSizeText(errorMessage,
            style: const TextStyle(fontFamily: 'Nunito', fontSize: 20.0))
      ],
    );
  }
}
