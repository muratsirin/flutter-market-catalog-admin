import 'package:flutter/material.dart';
import 'package:market_katalog/Provider/market/market_data.dart';
import 'package:market_katalog/view/components/app_textfield.dart';
import 'package:market_katalog/view/components/save_button.dart';
import 'package:provider/provider.dart';

class AddMarketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Market Ekle',
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            AppTextField(
              autoFocus: true,
              labelText: 'Market Adı',
              onChanged: (value) {
                Provider.of<MarketData>(context, listen: false).marketName =
                    value;
              },
            ),
            AppTextField(
              autoFocus: false,
              labelText: 'Market Öncelik',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                Provider.of<MarketData>(context, listen: false).marketPriority =
                    int.parse(value);
              },
            ),
            SaveButton(
              onPressed: () {
                Provider.of<MarketData>(context, listen: false)
                    .insertMarketToFireStore(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
