// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/foundation.dart';

// class UserProvider with ChangeNotifier {
//   List<Map<String, dynamic>> _users = [];

//   List<Map<String, dynamic>> get users => _users;

//   UserProvider() {
//     fetchUsers();
//   }

//   fetchUsers() {
//     FirebaseFirestore.instance
//         .collection('users')
//         .get()
//         .then((QuerySnapshot querySnapshot) {
//       _users = querySnapshot.docs.map((doc) => doc.data()).toList();
//       notifyListeners();
//     });
//   }
// }
