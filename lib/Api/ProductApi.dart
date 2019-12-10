import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shooops/models/productModel.dart';
import 'package:shooops/screens/notify/productNotify.dart';

getProduct(ProductApiNotifier productApiNotifier) async {
  QuerySnapshot snapshot = await Firestore.instance.collection('Products').getDocuments();

  List<ProductApiCall> _productList = [];

  snapshot.documents.forEach((document) {
    ProductApiCall produts = ProductApiCall.fromMap(document.data);
    _productList.add(produts);
  });

  productApiNotifier.productList = _productList;
}

// class ProductApi extends ChangeNotifier {
//   final Firestore firestore = Firestore.instance;

//   // ProductApi.formSnapshot(
//   //   DocumentSnapshot snapshot,
//   // ) {
//   //   Map data = snapshot.data;
//   //   productName = data["ProName"];
//   String productName;
//   String productPrice;
//   String productDescription;
//   String productColor;
//   final String productSize;
//   String productImages;

//   ProductApi(this.productName, this.productPrice, this.productDescription,
//       this.productColor, this.productSize, this.productImages);
//   Future geeetData() async {
//     try {
//       if (firestore != null) {
//         return Firestore.instance.collection("Products").snapshots();
//       }
//       return false;
//     } catch (e) {
//       print(e.toString());
//       return true;
//     }
//   }

//   Future get getdata async {
//     await for (var snapshot in firestore.collection("Products").snapshots()) {
//       for (var snapshot in snapshot.documents) {
//         print(snapshot.data["ProName"]);
//         productName = snapshot.data["ProName"];
//         productDescription = snapshot.data["ProDecs"];
//         productColor = snapshot.data["ProColor"];
//         productPrice = snapshot.data["Prices"];
//         productImages = snapshot.data["Images"];
//       }
//     }
//   }
// }

// class ProductApi {
//   final String productName;
//   final String productPrice;
//   final String productDescription;
//   final String productColor;
//   final String productSize;
//   final String productImages;

//   const ProductApi(
//       {
//       this.productName,
//       this.productPrice,
//       this.productDescription,
//       this.productColor,
//       this.productSize,
//       this.productImages});
// }

// class FirebaseApi extends StatefulWidget {

//   final String productName;
//   final String productPrice;
//   final String productDescription;
//   final String productColor;
//   final String productSize;
//   final String productImages;

//   const FirebaseApi({Key key, this.productName, this.productPrice, this.productDescription, this.productColor, this.productSize, this.productImages}) : super(key: key);

//   @override
//   _FirebaseApiState createState() => _FirebaseApiState();
// }

// class _FirebaseApiState extends State<FirebaseApi> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder(
//         stream: Firestore.instance.collection("Products").snapshots(),
//         initialData: Firestore,
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           return ProductApi(productImages: snapshot.data.documents["Images"],) ;
//           // ProductApi(productImages: snapshot.data["Images"],);
//         },
//       ),
//     );
//   }
// }

// class FirestoreListView extends StatelessWidget {
//   final String documents;
//   FirestoreListView({this.documents});

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
