import 'package:camera_app/firebase/models/solution.dart';
import 'package:camera_app/firebase/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {
  Future<bool> register(String name, String email, String password) async {
    try {
      final cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (cred.user != null) {
        Map<String, dynamic> userMap = {
          "id": cred.user!.uid,
          "name": name,
          "email": email
        };
        await FirebaseFirestore.instance
            .collection("users")
            .doc(cred.user!.uid)
            .set(userMap);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<UserModel> login(String email, String password) async {
    try {
      final cred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (cred.user != null) {
        final doc = await FirebaseFirestore.instance
            .collection("users")
            .doc(cred.user!.uid)
            .get();

        if (doc.data() != null) {
          return UserModel.fromMap(doc.data()!);
        } else {
          throw Exception("user has no data");
        }
      } else {
        throw Exception("error on authentication");
      }
    } catch (e) {
      print(e);
      throw Exception("an error occured");
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  //get data from firebase

  Future<List<Solution>> getSolution(String modelResult) async {
    final query = await FirebaseFirestore.instance
        .collection("solutions")
        .where("type", isEqualTo: modelResult)
        .get();
    final docs = query.docs;

    return docs.map((document) {
      return Solution.fromMap(document.data());
    }).toList();
  }
}
