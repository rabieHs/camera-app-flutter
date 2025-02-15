import 'package:camera/camera.dart';
import 'package:camera_app/affichage.dart';
import 'package:camera_app/main.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CameraController? controller;

  @override
  void initState() {
    controller = CameraController(cameras[1], ResolutionPreset.high);

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
                    XFile image = await controller!.takePicture();
                    if (image.path.isNotEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Success "),
                        backgroundColor: Colors.green,
                      ));
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => Affichage(image)));
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
