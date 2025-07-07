import 'package:auto_size_text/auto_size_text.dart';
import 'package:campus_connect_frontend/constants/color_consts.dart';
import 'package:flutter/material.dart';

Widget CustomButton(
    BuildContext context,
    String buttonText,
    Color? buttonColor,
    void Function() onPressed,
    double? buttonWidth,
    double? buttonHeight,
    double? buttonRadius) {
  return SizedBox(
    width: buttonWidth != null
        ? MediaQuery.of(context).size.width * buttonWidth
        : MediaQuery.of(context).size.width * 0.6,
    height: buttonHeight != null
        ? MediaQuery.of(context).size.height * buttonHeight
        : MediaQuery.of(context).size.height * 0.08,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor ?? ColorConsts().secondary_pink,
        shape: RoundedRectangleBorder(
          side:
              buttonColor == null || buttonColor != ColorConsts().secondary_pink
                  ? BorderSide(
                      color: ColorConsts().secondary_pink.withAlpha(100),
                    )
                  : BorderSide.none,
          borderRadius: BorderRadius.circular(buttonRadius ?? 10.0),
        ),
      ),
      child: AutoSizeText(
        buttonText,
        maxLines: 1,
        style: const TextStyle(
            color: Colors.white, fontSize: 30.0, fontFamily: 'Nunito'),
      ),
    ),
  );
}
