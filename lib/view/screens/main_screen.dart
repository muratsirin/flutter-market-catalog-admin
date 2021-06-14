import 'package:flutter/material.dart';
import 'package:market_katalog/Provider/utils/utils.dart';
import 'package:market_katalog/view/screens/katalog_screen.dart';
import 'package:market_katalog/view/screens/market_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  final List<Widget> mainScreenWidgets = [
    MarketScreen(),
    KatalogScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Provider.of<Utils>(context, listen: false)
              .floatingActionButtonPressed(context);
        },
      ),
      appBar: AppBar(
        title: Center(
          child: Text(
            Provider.of<Utils>(context).setMainScreenAppBarTitle(),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: 'Marketler',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_bag,
            ),
            label: 'Kataloglar',
          ),
        ],
        currentIndex:
            Provider.of<Utils>(context).bottomNavigationBarSelectedIndex,
        onTap: Provider.of<Utils>(context).onTappedNavigationBar,
      ),
      body: mainScreenWidgets.elementAt(
          Provider.of<Utils>(context).bottomNavigationBarSelectedIndex),
    );
  }
}
