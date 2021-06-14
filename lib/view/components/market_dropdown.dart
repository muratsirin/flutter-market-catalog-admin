import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_katalog/Provider/catalog/catalog_data.dart';
import 'package:market_katalog/Provider/market/market_data.dart';
import 'package:provider/provider.dart';

class MarketDropDown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Provider.of<MarketData>(context).getMarketsFromFireStore(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.blue,
            ),
          );
        }
        return Consumer<MarketData>(
          builder: (context, marketData, child) {
            final market = marketData.getMarkets(snapshot: snapshot);
            return DropdownButton(
              value: Provider.of<CatalogData>(context).selectedMarketName,
              onChanged: (value) {
                Provider.of<CatalogData>(context, listen: false)
                    .selectedMarketName = value;
              },
              items: market.map(
                (e) {
                  return DropdownMenuItem(
                    value: e.marketName,
                    child: Text(e.marketName),
                  );
                },
              ).toList(),
            );
          },
        );
      },
    );
  }
}
