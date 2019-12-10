
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductApiCall {
  String id;
  String img;
  String title;
  String price;
  String rattingValue;
  String itemSale;
  String description;
  List subIngredients = [];
  Timestamp createdAt;
  Timestamp updatedAt;

  ProductApiCall();
  ProductApiCall.fromMap(Map<String, dynamic> data) {
    id = data["id"];
    title = data["ProName"];
    price = data["Prices"].toString();
    img = data["Images"];
    description = data["ProDecs"];
    rattingValue = data["rattingValue"];
    itemSale = data["itemSale"];
    subIngredients = data['subIngredients'];
    createdAt = data['createdAt'];
    updatedAt = data['updatedAt'];
  }
  // Food.fromMap(Map<String, dynamic> data) {
  //   id = data['id'];
  //   name = data['name'];
  //   category = data['category'];
  //   image = data['image'];
  //   subIngredients = data['subIngredients'];
  //   createdAt = data['createdAt'];
  //   updatedAt = data['updatedAt'];
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ProName': title,
      'Prices': price,
      'image': img,
      'itemSale': itemSale,
      'rating': rattingValue,
      'description': description,
      'subIngredients': subIngredients,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}
