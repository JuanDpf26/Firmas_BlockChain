import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class UserService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // CREATE
  Future<void> createUser(UserModel user) async {
    await _db.collection('usuarios').doc(user.uid).set(user.toMap());
  }

  // READ
  Future<UserModel?> getUser(String uid) async {
    var doc = await _db.collection('usuarios').doc(uid).get();

    if (doc.exists) {
      return UserModel.fromMap(doc.data()!);
    }
    return null;
  }

  // UPDATE
  Future<void> updateEmail(String uid, String email) async {
    await _db.collection('usuarios').doc(uid).update({
      'email': email,
    });
  }

  // DELETE
  Future<void> deleteUser(String uid) async {
    await _db.collection('usuarios').doc(uid).delete();
  }
}