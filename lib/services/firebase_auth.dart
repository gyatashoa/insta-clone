import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_media_app/databases/tempData.dart';

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

  Future<void> logout() async {
    await _auth.signOut().catchError((err) => print(err));
  }
}
