import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthServices {
  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<FirebaseUser> login(String email, String password) async {
    print(email);
    print(password);
    try {
      AuthResult firebaseResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser firebaseUser = firebaseResult.user;
      return firebaseUser;
    } catch (e) {
      print(e);
    }
  }
}
