import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';


 class ProductApi {
  String productName;
  String productPrice;
  String productDescription;
  String productColor;
  String productSize;
  String productImages;

final Firestore firestore = Firestore.instance;

  // ProductApi.formSnapshot(
  //   DocumentSnapshot snapshot,
  // ) {
  //   Map data = snapshot.data;
  //   productName = data["ProName"];
  //   productImages = data["Images"];
  // }
  Future get getdata async {
  await for (var snapshot in firestore.collection("Products").snapshots()) {
    for (var snapshot in snapshot.documents) {
      print(snapshot.data["ProName"]);
      this.productName = snapshot.data["ProName"];
      this.productDescription = snapshot.data["ProDecs"];
      this.productColor = snapshot.data["ProColor"];
      this.productPrice = snapshot.data["Prices"];
      this.productImages = snapshot.data["Images"];
    }
  }
}


}

