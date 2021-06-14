import 'package:flutter/material.dart';
import 'package:market_katalog/view/components/app_circular_progress_indicator.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CatalogScreen extends StatelessWidget {
  final String catalogFileURL;
  final String catalogName;
  CatalogScreen({this.catalogFileURL, this.catalogName});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(catalogName),
        ),
      ),
      body: catalogFileURL == ''
          ? AppCircularProgressIndicator()
          : SfPdfViewer.network(catalogFileURL),
    );
  }
}
