import 'package:flutter/material.dart';
import 'package:market_katalog/utils/constants.dart';

class SaveButton extends StatelessWidget {
  final Function onPressed;

  SaveButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          kAppPrimaryColor,
        ),
      ),
      child: Text(
        'KAYDET',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}
