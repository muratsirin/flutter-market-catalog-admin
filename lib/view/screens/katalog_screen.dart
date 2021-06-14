import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:market_katalog/Provider/catalog/catalog_data.dart';
import 'package:market_katalog/view/components/app_circular_progress_indicator.dart';
import 'package:market_katalog/view/components/katalog_list.dart';
import 'package:provider/provider.dart';

class KatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder<QuerySnapshot>(
        stream: Provider.of<CatalogData>(context).getCatalogsFromFireStore(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: AppCircularProgressIndicator(),
            );
          } else {
            return KatalogList(
              snapshot: snapshot,
            );
          }
        },
      ),
    );
  }
}
