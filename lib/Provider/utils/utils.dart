import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_katalog/view/screens/add_katalog_screen.dart';
import 'package:market_katalog/view/screens/add_market_screen.dart';

class Utils with ChangeNotifier {
  int bottomNavigationBarSelectedIndex = 0;
  String mainScreenAppBarTitle;

  void floatingActionButtonPressed(BuildContext context) {
    if (bottomNavigationBarSelectedIndex == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddMarketScreen()));
    } else if (bottomNavigationBarSelectedIndex == 1) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => AddKatalogScreen()));
    }
  }

  String setMainScreenAppBarTitle() {
    if (bottomNavigationBarSelectedIndex == 0) {
      mainScreenAppBarTitle = 'Marketler';
    } else if (bottomNavigationBarSelectedIndex == 1) {
      mainScreenAppBarTitle = 'Kataloglar';
    }

    return mainScreenAppBarTitle;
  }

  void onTappedNavigationBar(int index) {
    bottomNavigationBarSelectedIndex = index;
    notifyListeners();
  }
}
