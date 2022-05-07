import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraProvider extends ChangeNotifier {
  File file;
  ImageSource imageSource;
  String image;
  selectSource(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              'Selecr the image source',
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    this.imageSource = ImageSource.camera;

                    getImageFromCamera();
                    Navigator.pop(context);
                  },
                  child: Text('Camera')),
              TextButton(
                  onPressed: () {
                    this.imageSource = ImageSource.gallery;
                    getImageFromCamera();
                    Navigator.pop(context);
                  },
                  child: Text('Gallery')),
            ],
          );
        });
  }

  getImageFromCamera() async {
    XFile xFile = await ImagePicker().pickImage(source: this.imageSource);
    this.file = File(xFile.path);
    notifyListeners();

  }
}
