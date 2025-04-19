import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;

  // Get a reference to the database root or a specific path
  DatabaseReference get _rootRef => _firebaseDatabase.ref();
  DatabaseReference _ref(String path) => _rootRef.child(path);

  /// Create or Update Data
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      await _ref(path).set(data);
    } catch (e) {
      throw Exception('Failed to set data: $e');
    }
  }

  /// Read Data Once
  Future<Map<String, dynamic>?> getData(String path) async {
    try {
      final snapshot = await _ref(path).get();
      return snapshot.value as Map<String, dynamic>?;
    } catch (e) {
      throw Exception('Failed to read data: $e');
    }
  }

  /// Update Specific Fields (without overwriting entire object)
  Future<void> updateData({
    required String path,
    required Map<String, dynamic> updates,
  }) async {
    try {
      await _ref(path).update(updates);
    } catch (e) {
      throw Exception('Failed to update data: $e');
    }
  }

  /// Delete Data
  Future<void> deleteData(String path) async {
    try {
      await _ref(path).remove();
    } catch (e) {
      throw Exception('Failed to delete data: $e');
    }
  }

  /// Listen for Real-Time Changes
  Stream<Map<String, dynamic>?> streamData(String path) {
    return _ref(path).onValue.map((event) {
      return event.snapshot.value as Map<String, dynamic>?;
    });
  }
}
