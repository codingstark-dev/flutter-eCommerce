// import 'package:cloud_firestore/cloud_firestore.dart';

// class DatabaseService {
//   final CollectionReference storesamething =
//       Firestore.instance.collection("Anything");
//   final String uid;
//   DatabaseService({this.uid});

//   Future updateUserData(String sugar, String name, int strength) async {
//     return await storesamething.document(uid).setData({
//       'sugar': sugar,
//       'name': name,
//       'strength': strength,
//     });
//   }

//   Stream<QuerySnapshot> get lool{
// return storesamething.snapshots();
//   }
// }
