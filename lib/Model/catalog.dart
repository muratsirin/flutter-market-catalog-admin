import 'package:cloud_firestore/cloud_firestore.dart';

class Catalog {
  String documentID;
  String catalogName;
  int catalogPriority;
  String marketName;
  String catalogImageURL;
  String catalogFileURL;
  FieldValue addedTime;

  Catalog(
      {this.documentID,
      this.catalogName,
      this.catalogPriority,
      this.marketName,
      this.catalogImageURL,
      this.catalogFileURL,
      this.addedTime});

  Catalog.withID(
      {this.documentID,
      this.catalogName,
      this.catalogPriority,
      this.marketName,
      this.catalogImageURL,
      this.catalogFileURL,
      this.addedTime});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['catalogName'] = this.catalogName;
    map['catalogPriority'] = this.catalogPriority;
    map['marketName'] = this.marketName;
    map['catalogImageURL'] = this.catalogImageURL;
    map['catalogFileURL'] = this.catalogFileURL;
    map['addedTime'] = this.addedTime;

    return map;
  }

  factory Catalog.fromMap(QueryDocumentSnapshot queryDocumentSnapshot) {
    return new Catalog(
      documentID: queryDocumentSnapshot.id,
      catalogName: queryDocumentSnapshot.data()['catalogName'],
      catalogPriority: queryDocumentSnapshot.data()['catalogPriority'],
      catalogImageURL: queryDocumentSnapshot.data()['catalogImageURL'],
      catalogFileURL: queryDocumentSnapshot.data()['catalogFileURL'],
      marketName: queryDocumentSnapshot.data()['marketName'],
    );
  }
}
