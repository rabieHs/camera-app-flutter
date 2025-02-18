import 'package:camera_app/firebase/services/firebase_services.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  Login({super.key});
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
              "Login",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
                try {
                  final userData = await FirebaseServices()
                      .login(emailController.text, passwordController.text);

                  print("email: ${userData.id}");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Success login"),
                    backgroundColor: Colors.green,
                  ));
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e.toString()),
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
