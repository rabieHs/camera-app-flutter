import 'package:camera_app/firebase/models/solution.dart';
import 'package:camera_app/firebase/services/firebase_services.dart';
import 'package:flutter/material.dart';

class AddGetData2 extends StatefulWidget {
  const AddGetData2({super.key});

  @override
  State<AddGetData2> createState() => _AddGetDataState();
}

class _AddGetDataState extends State<AddGetData2> {
  String result = "";

  getModelResult() {
    result = "stress";
    setState(() {});
  }

  @override
  void initState() {
    getModelResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: FirebaseServices().getSolution(result),
            builder: (context, result) {
              if (result.hasError) {
                return Center(
                  child: Text(result.error.toString()),
                );
              } else if (result.hasData && result.data != null) {
                List<Solution> solutions = result.data!;

                return ListView.builder(
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
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
