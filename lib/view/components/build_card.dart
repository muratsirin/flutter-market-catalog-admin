import 'package:flutter/material.dart';
import 'package:market_katalog/utils/constants.dart';

class BuildCard extends StatelessWidget {
  final String networkImage;
  final String textText;
  final Function onLongPress;

  BuildCard({
    this.networkImage,
    this.textText,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  child: networkImage != null
                      ? Image.network(
                          networkImage,
                          width: MediaQuery.of(context).size.width * 0.52,
                          fit: BoxFit.fill,
                        )
                      : Container(),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                ),
              ),
              Text(
                textText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: kAppPrimaryColor,
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
        onLongPress: onLongPress,
      ),
    );
  }
}
