import 'package:cloud_firestore/cloud_firestore.dart';

class Market {
  String documentId;
  String marketName;
  int marketPriority;
  FieldValue addedTime;

  Market(
      {this.documentId, this.marketName, this.marketPriority, this.addedTime});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['marketName'] = this.marketName;
    map['marketPriority'] = this.marketPriority;
    map['addedTime'] = this.addedTime;

    return map;
  }

  factory Market.fromMap(QueryDocumentSnapshot queryDocumentSnapshot) {
    return new Market(
      documentId: queryDocumentSnapshot.id,
      marketName: queryDocumentSnapshot.data()['marketName'],
      marketPriority: queryDocumentSnapshot.data()['marketPriority'],
    );
  }
}
