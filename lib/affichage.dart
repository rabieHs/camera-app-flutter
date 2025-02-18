import 'dart:io';

import 'package:camera/camera.dart';
import 'package:camera_app/database.dart';
import 'package:flutter/material.dart';

class Affichage extends StatefulWidget {
  XFile image;
  String resultat;

  Affichage(this.image, this.resultat);

  @override
  State<Affichage> createState() => _AffichageState();
}

class _AffichageState extends State<Affichage> {
  List<String> solutions = [];

  getData() {
    final jsonData = databse.firstWhere((data) {
      return data['class'] == widget.resultat;
    });

    print("DEBUG:$jsonData");

    solutions = jsonData['solutions'];
    print("DEBUG:$solutions");
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Center(child: Image.file(File(widget.image.path))),
          ListView.builder(
              shrinkWrap: true,
              itemCount: solutions.length,
              itemBuilder: (context, index) {
                return Card(
                    child: ListTile(
                  title: Text(solutions[index]),
                ));
              })
        ],
      ),
    );
  }
}
