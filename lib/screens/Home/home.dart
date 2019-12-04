// import 'package:flutter/material.dart';
// import 'package:shooops/screens/Home/brewList.dart';
// import 'package:shooops/services/auth.dart';
// import 'package:provider/provider.dart';
// import 'package:shooops/services/DatabaseService.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final AuthService auth = AuthService();
//     return StreamProvider<QuerySnapshot>.value(
//       value: DatabaseService().lool,
//           child: Scaffold(
//          resizeToAvoidBottomPadding: false,
//         appBar: AppBar(
//           title: Text("Login&signup"),
//           elevation: 0,
//           backgroundColor: Colors.amberAccent,
//           actions: <Widget>[
//             FlatButton.icon(
//               icon: Icon(Icons.person),
//               onPressed: () async {
//                 await auth.signOut();
//               },
//               label: Text("Logout"),
//             )
//           ],
//         ),

//         body: BrewList(),
//       ),
//     );
//   }
// }
