import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});
  //collection refference

  final CollectionReference brewCollection =
      Firestore.instance.collection('brew');

  Future updateUserData(String name, int weight, int height) async {
    return await brewCollection.document(uid).setData({
      'name': name,
      'weight': weight,
      'height': height,
    });
  }
}
