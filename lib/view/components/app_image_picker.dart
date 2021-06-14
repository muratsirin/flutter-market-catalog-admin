import 'dart:io';
import 'package:flutter/material.dart';

class AppImagePicker extends StatelessWidget {
  final String title;
  final File image;
  final Function onTap;

  AppImagePicker({this.title, this.image, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.image),
            title: Text(title),
          ),
          Container(
            width: 250,
            height: 250,
            alignment: Alignment.center,
            child: image != null
                ? Image.file(
                    image,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    'images/no_logo.png',
                    fit: BoxFit.fill,
                  ),
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
