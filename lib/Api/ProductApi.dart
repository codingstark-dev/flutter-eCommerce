import 'package:cloud_firestore/cloud_firestore.dart';
  final Firestore firestore = Firestore.instance;
class ProductApi {
  String productName;
  String productPrice;
  String productDescription;
  String productColor;
  String productSize;
  String productImages;

  ProductApi(this.productName, this.productPrice, this.productDescription,
      this.productColor, this.productSize, this.productImages);
      ProductApi.formSnapshot(DocumentSnapshot snapshot,){
        Map data = snapshot.data;
        productName = data["ProName"];
        productImages = data["Images"];
        
      }
      
}
// class ProductListDb {
// final getData = firestore.collection("Products").snapshots();

// }