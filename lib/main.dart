import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'home.dart';

List<CameraDescription> cameras = [];

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MaterialApp(
    home: Home(),
  ));
}
