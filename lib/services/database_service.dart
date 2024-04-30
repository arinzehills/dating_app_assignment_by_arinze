import 'package:firebase_database/firebase_database.dart';

class DatabaseService {
  static Future<void> printDataFromURL(databaseReference) async {
    databaseReference
        .child('your_data_node')
        .once()
        .then((DataSnapshot snapshot) {
      // Handle data here
      print('Data from Firebase: ${snapshot.value}');
    });
  }
}
