import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:market_katalog/Provider/catalog/catalog_data.dart';
import 'package:market_katalog/view/components/app_image_picker.dart';
import 'package:market_katalog/view/components/app_textfield.dart';
import 'package:market_katalog/view/components/market_dropdown.dart';
import 'package:market_katalog/view/components/save_button.dart';
import 'package:provider/provider.dart';

class AddKatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: Text(
            'Katalog Ekle',
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            AppTextField(
              autoFocus: true,
              labelText: 'Katalog Adı',
              onChanged: (value) {
                Provider.of<CatalogData>(context, listen: false).catalogName =
                    value;
              },
            ),
            AppTextField(
              autoFocus: false,
              labelText: 'Katalog Öncelik',
              keyboardType: TextInputType.number,
              onChanged: (value) {
                Provider.of<CatalogData>(context, listen: false)
                    .catalogPriority = int.parse(value);
              },
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Market: ',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                MarketDropDown(),
              ],
            ),
            AppImagePicker(
              title: 'Katalog Görseli Seçiniz',
              image: Provider.of<CatalogData>(context).catalogImage,
              onTap: () {
                Provider.of<CatalogData>(context, listen: false)
                    .getCatalogImage();
              },
            ),
            ListTile(
              leading: Icon(Icons.image),
              title: GestureDetector(
                child: Text(
                  Provider.of<CatalogData>(context).catalogFileName,
                ),
                onTap: () {
                  Provider.of<CatalogData>(context, listen: false)
                      .getCatalogFile();
                },
              ),
            ),
            SaveButton(
              onPressed: () {
                Provider.of<CatalogData>(context, listen: false)
                    .insertCatalogToFireStore(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
