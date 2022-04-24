import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffii/service/firebase/fire_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CoffeeUploadProvider extends ChangeNotifier {
  Future uploadCoffeeToDB(name, price, context) async {
    await FireService.store.collection('coffee').doc(name).set({
      'name': name,
      'price': price,
      // 'image_url': '',
      'create_at': FieldValue.serverTimestamp(),
    });
    Navigator.pop(context);
  }

  Future uploadImageToStorage(XFile file, name) async {
    var image = await FireService.storage
        .ref()
        .child('coffee')
        .child('image')
        .child(name)
        .putFile(File(file.path));
    String downloadUrl = await image.ref.getDownloadURL();
    await FireService.store.collection('coffee').doc(name).set(
      {'image_url': downloadUrl},
      SetOptions(merge: true), //update qilib uzgartiradi
    );
  }
}
