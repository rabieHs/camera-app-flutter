import 'package:camera_app/firebase/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          spacing: 15,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Register",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                  labelText: "name",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            MaterialButton(
              onPressed: () async {
                final result = await FirebaseServices().register(
                    usernameController.text,
                    emailController.text,
                    passwordController.text);
                if (result == true) {
// show success notification
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Success Registration"),
                    backgroundColor: Colors.green,
                  ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Error Registration"),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text(
                "Login",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
            )
          ],
        ),
      ),
    );
  }
}
