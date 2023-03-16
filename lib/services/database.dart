import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');
  final String? uid;
  DatabaseService({this.uid});

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

  // get brews stream
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
