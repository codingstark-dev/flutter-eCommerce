import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  BrewList({Key key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
   final brew = Provider.of<QuerySnapshot>(context);
  //  print(brew.documents);
  for (var doc in brew.documents) {
    print(doc.data);
  }
   return Container();
  }
}