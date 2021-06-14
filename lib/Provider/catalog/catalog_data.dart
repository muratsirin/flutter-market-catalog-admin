import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:market_katalog/Model/catalog.dart';
import 'package:path/path.dart';

final _fireStore = FirebaseFirestore.instance;

class CatalogData with ChangeNotifier {
  String catalogName;
  int catalogPriority;
  String catalogImageURL;
  String catalogFileURL;
  File catalogImage;
  File catalogFile;
  String catalogFileName = 'Katalog Dosyası Seçiniz';
  String selectedMarketName;

  Future getCatalogImage() async {
    ImagePicker imagePicker = ImagePicker();
    PickedFile pickedFile;

    try {
      pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        catalogImage = File(pickedFile.path);
        notifyListeners();
      } else {
        print('Resim seçilmedi');
      }
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  Future getCatalogFile() async {
    FilePickerResult filePickerResult;
    PlatformFile platformFile;

    try {
      filePickerResult = await FilePicker.platform.pickFiles();
      if (filePickerResult != null) {
        catalogFile = File(filePickerResult.files.single.path);
        platformFile = filePickerResult.files.first;
        catalogFileName = platformFile.name;
        notifyListeners();
      } else {
        print('Dosya seçilmedi');
      }
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  void insertCatalogToFireStore(BuildContext context) {
    try {
      String catalogImageName = basename(catalogImage.path);
      String catalogFileName = basename(catalogFile.path);
      Reference imageReference = FirebaseStorage.instance
          .ref()
          .child('catalogs/catalog_images/' + catalogImageName);
      Reference fileReference =
          FirebaseStorage.instance.ref().child('catalogs/' + catalogFileName);
      UploadTask uploadTask = imageReference.putFile(catalogImage);
      uploadTask = fileReference.putFile(catalogFile);

      uploadTask.whenComplete(
        () async {
          catalogImageURL = await imageReference.getDownloadURL();
          catalogFileURL = await fileReference.getDownloadURL();

          addCatalog(
            catalog: Catalog(
              catalogName: catalogName,
              catalogPriority: catalogPriority,
              catalogImageURL: catalogImageURL,
              catalogFileURL: catalogFileURL,
              marketName: selectedMarketName,
              addedTime: FieldValue.serverTimestamp(),
            ),
          );
        },
      );
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  void addCatalog({Catalog catalog}) {
    try {
      if (catalogName != '' && catalogPriority != null) {
        _fireStore.collection('catalogs').add(catalog.toMap());
      }
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  Stream<QuerySnapshot> getCatalogsFromFireStore() {
    try {
      return _fireStore
          .collection('catalogs')
          .orderBy('addedTime', descending: true)
          .snapshots();
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  List<Catalog> getCatalogs({dynamic snapshot}) {
    try {
      final catalogSnapshot = snapshot.data.docs.reversed;
      List<Catalog> catalogs = [];
      for (var catalogData in catalogSnapshot) {
        catalogs.add(Catalog.fromMap(catalogData));
      }

      return catalogs;
    } catch (e) {
      throw 'Bir hata oluştu';
    }
  }

  void deleteCatalog({String documentID}) {
    _fireStore.collection('catalogs').doc(documentID).delete();
  }
}
