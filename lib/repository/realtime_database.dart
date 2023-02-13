import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:prect/model/config/database_path.dart';

class RealtimeDatabase {
  static late String _userID;

  static final DatabaseReference _reference = FirebaseDatabase.instance.ref('users');

  RealtimeDatabase.init() {
    _userID = FirebaseAuth.instance.currentUser?.uid ?? '';
  }

  static Future<bool> write({required DatabaseUserIdChild path, required Map<String, Object?> value}) async {
    try {
      await _reference.child(_userID).child(path.name).set(value);
      return true;
    } catch (e) {
      print('Error : $e');
      return false;
    }
  }

  static Future<List<DataSnapshot>?> read({required DatabaseUserIdChild path}) async {
    try {
      final snapshot = await _reference.child(_userID).child(path.name).get();
      if (snapshot.exists) {
        return snapshot.children.toList();
      } else {
        return null;
      }
    } catch (e) {
      print('Error : $e');
      return null;
    }
  }

  static StreamSubscription monitorChange({
    required DatabaseUserIdChild path,
    required Function(DatabaseEvent event) eventListener}) {
    return _reference.child(_userID).child(path.name).onChildAdded.listen(eventListener);
  }

  static Future<bool> remove({required DatabaseUserIdChild path}) async {
    try {
      await _reference.child(_userID).child(path.name).remove();
      return true;
    } catch (e) {
      print('Error : $e');
      return false;
    }
  }
}