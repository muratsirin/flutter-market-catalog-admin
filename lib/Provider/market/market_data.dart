import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:market_katalog/Model/market.dart';

final _fireStore = FirebaseFirestore.instance;

class MarketData with ChangeNotifier {
  String marketName;
  int marketPriority;
  String marketDocumentID;

  void insertMarketToFireStore(BuildContext context) {
    try {
      addMarket(
        market: Market(
          marketName: marketName,
          marketPriority: marketPriority,
          addedTime: FieldValue.serverTimestamp(),
        ),
      );
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  void addMarket({Market market}) {
    try {
      if (marketName != '' && marketPriority != null) {
        _fireStore.collection('markets').add(market.toMap());
      }
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  Stream<QuerySnapshot> getMarketsFromFireStore() {
    try {
      return _fireStore
          .collection('markets')
          .orderBy('addedTime', descending: true)
          .snapshots();
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  List<Market> getMarkets({dynamic snapshot}) {
    try {
      final marketSnapshot = snapshot.data.docs.reversed;
      List<Market> markets = [];
      for (var marketData in marketSnapshot) {
        markets.add(Market.fromMap(marketData));
      }
      return markets;
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  void deleteMarketAndMarketCatalogs({String documentID, String marketName}) {
    _fireStore.collection('markets').doc(documentID).delete();
    _fireStore
        .collection('catalogs')
        .where('marketName', isEqualTo: marketName)
        .get()
        .then(
      (value) {
        value.docs.forEach(
          (element) {
            _fireStore.collection('catalogs').doc(element.id).delete();
          },
        );
      },
    );
  }
}
