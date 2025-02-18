import 'package:camera/camera.dart';
import 'package:camera_app/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<CameraDescription> cameras = [];
void main() async {
  cameras = await availableCameras();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        theme: const CupertinoThemeData(
          brightness: Brightness.light,
        ),
        home: Home());
  }
}
