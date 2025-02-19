import 'package:camera/camera.dart';
import 'package:camera_app/firebase/interfaces/add_get_data.dart';
import 'package:camera_app/firebase/interfaces/login.dart';
import 'package:camera_app/firebase/interfaces/register.dart';
import 'package:camera_app/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'firebase/interfaces/add_get_data_2.dart';
import 'firebase_options.dart';

List<CameraDescription> cameras = [];
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //FirebaseAuth.instance.signOut();
    // print(FirebaseAuth.instance.currentUser!.uid);
    return MaterialApp(
        home: FirebaseAuth.instance.currentUser != null
            ? AddGetData2()
            : Login());
  }
}
