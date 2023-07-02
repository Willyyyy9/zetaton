import 'package:firebase_auth/firebase_auth.dart';

class LoginServer {
  Future<UserCredential> login(
      {required String email, required String password}) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return credential;
  }
}
