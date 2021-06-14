import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:market_katalog/Provider/catalog/catalog_data.dart';
import 'package:market_katalog/Provider/market/market_data.dart';
import 'package:market_katalog/Provider/utils/utils.dart';
import 'package:market_katalog/view/components/app_theme_data.dart';
import 'package:market_katalog/view/screens/main_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MarketCatalogsAdmin());
}

class MarketCatalogsAdmin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Utils()),
        ChangeNotifierProvider(create: (context) => MarketData()),
        ChangeNotifierProvider(create: (context) => CatalogData()),
      ],
      child: MaterialApp(
        theme: appThemeData(),
        title: 'Market Katalogları',
        home: MainScreen(),
      ),
    );
  }
}
