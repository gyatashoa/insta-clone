import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TempData {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  static FirebaseUser firebaseUser;
  Future<void> getUser()async{
    firebaseUser = await _firebaseAuth.currentUser();
  }
}
