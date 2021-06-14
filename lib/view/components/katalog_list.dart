import 'package:flutter/material.dart';
import 'package:market_katalog/Provider/catalog/catalog_data.dart';
import 'package:market_katalog/view/components/show_alert_dialog.dart';
import 'package:market_katalog/view/screens/catalog_screen.dart';
import 'package:market_katalog/view/components/build_card.dart';
import 'package:provider/provider.dart';

class KatalogList extends StatelessWidget {
  final snapshot;

  KatalogList({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Consumer<CatalogData>(
      builder: (context, catalogData, child) {
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
              final catalog =
                  catalogData.getCatalogs(snapshot: snapshot)[index];
              return GestureDetector(
                child: BuildCard(
                  networkImage: catalog.catalogImageURL,
                  textText: catalog.catalogName,
                  onLongPress: () {
                    showAlertDialog(
                      context: context,
                      contentText:
                          '${catalog.catalogName} silenecek. Onaylıyor musunuz?',
                      onPressed: () {
                        Provider.of<CatalogData>(context, listen: false)
                            .deleteCatalog(documentID: catalog.documentID);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CatalogScreen(
                        catalogFileURL: catalog.catalogFileURL,
                        catalogName: catalog.catalogName,
                      ),
                    ),
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
