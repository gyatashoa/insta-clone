import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestoreServices {
  Firestore _firestore = Firestore.instance;
  Future getUserProfile(String uid) async {
    Stream<DocumentSnapshot> _doc =
        await _firestore.collection('userProfile').document(uid).snapshots();
    return _doc;
  }


}
