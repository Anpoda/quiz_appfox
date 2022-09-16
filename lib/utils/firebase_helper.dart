import 'package:cloud_firestore/cloud_firestore.dart';

class HelperFirebase {
  final db = FirebaseFirestore.instance;
  void saveResult(Map <String, dynamic>data) async {
    db.collection("results").add(data);
  }
}
