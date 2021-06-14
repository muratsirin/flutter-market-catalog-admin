import 'package:flutter/material.dart';

showAlertDialog(
    {BuildContext context, Function onPressed, String contentText}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(contentText),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('HAYIR'),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text('EVET'),
          ),
        ],
      );
    },
  );
}
