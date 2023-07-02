import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zetaton/app/data/constants.dart';
import 'package:zetaton/app/modules/register/model/user_model.dart';

class RegisterServer {
  Future<UserCredential> register(
      {required String email, required String password}) async {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }

  Future saveUser({required UserModel userModel}) async {
    final credential = FirebaseFirestore.instance
        .collection(Constants.userCollection)
        .doc(userModel.id)
        .set(userModel.toJson());
    return credential;
  }
}
