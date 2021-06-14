import 'package:flutter/material.dart';
import 'package:market_katalog/Provider/market/market_data.dart';
import 'package:market_katalog/view/components/build_card.dart';
import 'package:market_katalog/view/components/show_alert_dialog.dart';
import 'package:provider/provider.dart';

class MarketList extends StatelessWidget {
  final snapshot;

  MarketList({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Consumer<MarketData>(
      builder: (context, marketData, child) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            itemCount: snapshot.data.docs.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              final market = marketData.getMarkets(snapshot: snapshot)[index];
              return BuildCard(
                textText: market.marketName,
                onLongPress: () {
                  showAlertDialog(
                    context: context,
                    contentText:
                        '${market.marketName} ve bu markete bağlı kataloglar silinecek. Onaylıyor musunuz?',
                    onPressed: () {
                      Provider.of<MarketData>(context, listen: false)
                          .deleteMarketAndMarketCatalogs(
                              documentID: market.documentId,
                              marketName: market.marketName);
                      Navigator.pop(context);
                    },
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
