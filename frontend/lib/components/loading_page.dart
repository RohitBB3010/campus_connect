import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConsts().primary,
        body: Center(
          child: LoadingAnimationWidget.fourRotatingDots(
              color: ColorConsts().secondary_orange,
              size: MediaQuery.of(context).size.width * 0.3),
        ));
  }
}
