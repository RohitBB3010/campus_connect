import 'package:flutter/material.dart';

class SpacingConsts {
  SizedBox smallWidthBetweenFields(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * 0.03);
  }

  SizedBox mediumWidthBetweenFields(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * 0.05);
  }

  SizedBox largeWidthBetweenFields(BuildContext context) {
    return SizedBox(width: MediaQuery.of(context).size.width * 0.1);
  }

  SizedBox smallHeightBetweenFields(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.02);
  }

  SizedBox mediumHeightBetweenFields(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.05);
  }

  SizedBox largeHeightBetweenFields(BuildContext context) {
    return SizedBox(height: MediaQuery.of(context).size.height * 0.1);
  }

  SizedBox customWidthBetweenFields(BuildContext context, double width) {
    return SizedBox(width: MediaQuery.of(context).size.width * width);
  }

  SizedBox customHeightBetweenFields(BuildContext context, double height) {
    return SizedBox(height: MediaQuery.of(context).size.height * height);
  }
}
