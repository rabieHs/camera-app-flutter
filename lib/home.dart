import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_app/affichage.dart';
import 'package:camera_app/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraController? controller;

  @override
  void initState() {
    controller = CameraController(cameras[0], ResolutionPreset.high);

    controller!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });

    // Future.delayed(Duration(seconds: 3)).then((_){
    //   controller!.takePicture();
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: CameraPreview(controller!),
                    ),
                    // Positioned.fill(
                    //     left: 200, top: 150, child: Text("Dont Move"))
                  ],
                ),
                InkWell(
                  onTap: () async {
                    print("DEBUG: IMAGE TAKE SUCCESS");

                    XFile image = await controller!.takePicture();
                    if (image.path.isNotEmpty) {
                      final binaryImage = await image.readAsBytes();
                      final base64Image = base64.encode(binaryImage);

                      /// send data to the server

                      //
                      try {
                        final response = await http.post(
                          Uri.parse(
                              "http://10.0.2.2:5000/upload"), // Make sure this is the correct local IP
                          headers: {
                            "Content-Type": "application/json"
                          }, // Set JSON content type
                          body: jsonEncode({
                            "image": base64Image,
                          }), // Encode as JSON
                        );
                        if (response.statusCode == 200) {
                          final data = response.body;
                          Map data2 = json.decode(data);

                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  Affichage(image, data2['class'])));
                        }
                      } catch (e) {
                        print(e);
                      }
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Erro"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(width: 3)),
                  ),
                )
              ],
            ),
    );
  }
}
