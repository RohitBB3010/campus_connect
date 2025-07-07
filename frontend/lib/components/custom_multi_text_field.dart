import 'package:flutter/material.dart';

class CustomMultiTextField extends StatelessWidget {
  CustomMultiTextField(
      {super.key,
      required this.fieldHeight,
      required this.fieldWidth,
      required this.onChanged});
  double fieldWidth;
  double fieldHeight;
  IconData? prefixIcon;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * fieldWidth,
      height: MediaQuery.of(context).size.height * fieldHeight,
      child: TextField(
        onChanged: onChanged,
        // keyboardType: ,
      ),
    );
  }
}
