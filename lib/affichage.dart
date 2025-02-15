import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class Affichage extends StatelessWidget {
  XFile image;

  Affichage(this.image);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.file(File(image.path))),
    );
  }
}
