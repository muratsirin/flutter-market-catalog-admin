import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_katalog/Provider/market/market_data.dart';
import 'package:market_katalog/view/components/app_circular_progress_indicator.dart';
import 'package:market_katalog/view/components/market_list.dart';
import 'package:provider/provider.dart';

class MarketScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: Provider.of<MarketData>(context).getMarketsFromFireStore(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: AppCircularProgressIndicator(),
            );
          } else {
            return MarketList(
              snapshot: snapshot,
            );
          }
        },
      ),
    );
  }
}
