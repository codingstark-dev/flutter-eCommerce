import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

// Widget buildGridFilesToExport(){
//   return new StreamBuilder(
//     stream: Firestore.instance
//         .collection('users')
//         .document()
//         .collection('events')
//         .document()
//         .snapshots(),
//     builder: (context, snapshot) {
//       print(snapshot);
//       if (snapshot.hasError)
//         return new Text('Error: ${snapshot.error}');
//       switch (snapshot.connectionState) {
//         case ConnectionState.waiting: return new Text('Loading...');
//         default:
//           List videosList = snapshot.data['thumbnailsUrl'];
//           return
//             videosList != null ?
//             new GridView.count(
//               crossAxisCount: 2,
//               childAspectRatio: 1,
//               children: List.generate(snapshot.data['thumbnailsUrl'].length, (index) {
//                 return Container(
//                     padding: EdgeInsets.all(5.0),
//                     child: Column(
//                       children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(bottom: 2.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                             image: DecorationImage(
//                               image: NetworkImage(snapshot.data['thumbnailsUrl'][index]),
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),

//                       ],
//                     )
//                 );
//               }),
//             )
//                 :
//             Center(
//                 child: Container(
//                   width: 300,
//                   child: Text(
//                     'Ancora nessun video!\nVai nella Cartella amici e accetta i loro video!',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'acumin-pro',
//                       fontSize: 22,
//                     ),
//                   ),
//                 )
//             );
//       }
//     },
//   );
// // }
// dynamic datatas;
// final  firestore = Firestore.instance;
// @override
// void initState() {
//   getData().then((result){
// datatas = result;
//   });
// }
// Future getData() async {
//     try {

//       if (firestore != null) {
//         return  Firestore.instance.collection("Products").snapshots();
//       }
//       return false;
//     } catch (e) {
//       print(e.toString());
//       return true;
//     }
//   }
// Widget prodoo (){
// StreamBuilder(
//   stream: datatas ,
//   builder: (BuildContext context, AsyncSnapshot snapshot){
//     if (snapshot.hasData) {
//    GridItem(
//     description: snapshot.data.documents.data[""],
//   );
//     }else{

//     }

//   },
// );
// }


class FileData {
  FileData(
      {this.description,
      this.id,
      this.img,
      this.itemSale,
      this.price,
      this.rattingValue,
      this.title});

  final String id;
  final String img;
  final String title;
  final String price;
  final String rattingValue;
  final String itemSale;
  final String description;

  // dynamic datatas;
  // final firestore = Firestore.instance;
  // @override
  // void initState() {
  //   getData().then((result) {
  //     datatas = result;
  //   });
  // }

  // Future getData() async {
  //   try {
  //     if (firestore != null) {
  //       return Firestore.instance.collection("Products").snapshots();
  //     }
  //     return false;
  //   } catch (e) {
  //     print(e.toString());
  //     return true;
  //   }
  // }

// class FileData {

// Future<FileData> getImagePostFromDocument(DocumentSnapshot snapshot) async {
//      Map data = snapshot.data;
//     FileData post =  FileData(
//         img: data['Images']
//         );
//     return post;
//   }
  // Stream<List<FileData>> streamWeapons() {
  //   var ref = firestore.collection('Products').document().collection('weapons');

  //   return ref.snapshots().map((list) =>
  //       list.documents.map((doc) => FileData.fromFirestore(doc)).toList());
  // }

  // Stream<List<FileData>> streamDatas() {
  //   var ref = Firestore.instance.collection('Products').snapshots();
  //   return ref.map((data) =>
  //       data.documents.map((doc) => FileData.fromFirestore(doc)).toList());

  //   // print(doc.data["Images"])).toList());
  // // }
  // factory FileData.fromMap(Map<String, dynamic> data) {
  //   if (data == null) {
  //     return null;
  //   }
  //   final _id = data["id"];
  //   final _title = data["ProName"];
  //   final _price = data["Prices"];
  //   final _image = data["Images"];
  //   final _description = data["ProDecs"];
  //   final _rating = data["rattingValue"];
  //   final _itemsale = data["itemSale"];
  //   return FileData(
  //       id: _id,
  //       price: _price,
  //       description: _description,
  //       img: _image,
  //       title: _title,
  //       rattingValue: _rating,
  //       itemSale: _itemsale);
  // }

  // Stream readData() {
  //   final ref = Firestore.instance.collection("Products");
  //   final snapshot = ref.snapshots();
  //   return snapshot.map((snapshot) => snapshot.documents
  //       .map((snapshot) => sFileData.fromMap(snapshot.data)).toList());}

  // Stream<List<FileData>> readData() => _collectionStream(
  //       builder: (data) => FileData.fromMap(data),
  //     );
  Stream<List<T>> _collectionStream<T>({
    @required T builder(Map<String, dynamic> data),
  }) {
    final reference = Firestore.instance.collection("Products");
    final snapshots = reference.snapshots();
    return snapshots.map((snapshot) =>
        snapshot.documents.map((snapshot) => builder(snapshot.data)).toList());
  }

  // factory FileData.fromFirestore(DocumentSnapshot doc) {
  //   Map data = doc.data;
  //   return FileData(
  //       id: data["id"],
  //       title: data['ProName'],
  //       price: data['Prices'].toString(),
  //       img: data['Images'],
  //       description: data["ProDecs"],
  //       rattingValue: data["rattingValue"],
  //       itemSale: data["itemSale"]);
  // }

//   // FileData.fromSnapshot(DocumentSnapshot snapshot) {
//   //   _id = snapshot.data['id'];
//   //   _name = snapshot.data['ProName'];
//   //   _file = snapshot.data['Images'];
//   // }
}

class GridItem {
  final String id;
  final String img;
  final String title;
  final String price;
  final String rattingValue;
  final String itemSale;
  final String description;
  GridItem(
      {this.id,
      this.img,
      this.title,
      this.price,
      this.rattingValue,
      this.itemSale,
      this.description});
}

List<GridItem> gridItemArray = [
  GridItem(
    id: "1",
    img: "assets/imgItem/fashion1.jpg",
    title: "Firrona Skirt!",
    price: "\$ 10",
    itemSale: "932 Sale",
    rattingValue: "4.8",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "2",
    img: "assets/imgItem/acesoris1.jpg",
    title: "Arpenaz 4 Family Camping",
    price: "\$ 200",
    itemSale: "892 Sale",
    rattingValue: "4.2",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "3",
    img: "assets/imgItem/beauty1.jpg",
    title: "Mizzu Valipcious Liner Vintage",
    price: "\$ 4",
    itemSale: "1422 Sale",
    rattingValue: "4.7",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "4",
    img: "assets/imgItem/man1.jpg",
    title: "MENTLI Solid Blue Slim Fit",
    price: "\$ 15",
    itemSale: "523 Sale",
    rattingValue: "4.4",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "5",
    img: "assets/imgItem/girl1.jpg",
    title: "Korea Choker The Black",
    price: "\$ 20",
    itemSale: "130 Sale",
    rattingValue: "4.5",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "6",
    img: "assets/imgItem/kids1.jpg",
    title: "Mon Cheri Pinguin",
    price: "\$ 3",
    itemSale: "110 Sale",
    rattingValue: "4.8",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "7",
    img: "assets/imgItem/shoes1.jpg",
    title: "Dr. Kevin Women Casual Boots",
    price: "\$ 15",
    itemSale: "654 Sale",
    rattingValue: "4.1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
  GridItem(
    id: "8",
    img: "assets/imgItem/shoes2.jpg",
    title: "Gino Mariani Zenon",
    price: "\$ 100",
    itemSale: "1542 Sale",
    rattingValue: "4.1",
    description:
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen.....",
  ),
];
