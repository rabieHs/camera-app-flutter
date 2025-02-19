import 'package:camera_app/firebase/models/solution.dart';
import 'package:camera_app/firebase/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AddGetData extends StatefulWidget {
  const AddGetData({super.key});

  @override
  State<AddGetData> createState() => _AddGetDataState();
}

class _AddGetDataState extends State<AddGetData> {
  String result = "";

  getModelResult() {
    result = "stress";
    setState(() {});
  }

  List<Solution> solutions = [];

  getData() async {
    solutions = await FirebaseServices().getSolution(result);
    setState(() {});
  }

  @override
  void initState() {
    getModelResult();
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: solutions.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: solutions.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    solutions[index].title,
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    solutions[index].description,
                    style: TextStyle(color: Colors.grey),
                  ),
                );
              }),
    );
  }
}
