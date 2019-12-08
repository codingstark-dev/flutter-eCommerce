import 'package:cloud_firestore/cloud_firestore.dart';

class User {
    User({this.name,this.imageUrl,this.emailId,this.uid});
  final String uid;
  final String name;
  final String emailId;
  final String imageUrl;

  static User fromJSON(DocumentSnapshot userRef) {}
}