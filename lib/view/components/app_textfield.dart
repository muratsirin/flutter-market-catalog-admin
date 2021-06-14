import 'package:flutter/material.dart';
import 'package:market_katalog/utils/constants.dart';

class AppTextField extends StatelessWidget {
  final bool autoFocus;
  final String labelText;
  final Function onChanged;
  final TextInputType keyboardType;

  AppTextField(
      {this.autoFocus, this.labelText, this.onChanged, this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextField(
        autofocus: autoFocus,
        cursorColor: kAppPrimaryColor,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
