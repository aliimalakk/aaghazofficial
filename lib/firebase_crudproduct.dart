import 'package:cloud_firestore/cloud_firestore.dart';
import 'response.dart';
import 'adminPanel.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Product');
String imageURL = '';

class FirebaseCrud {

  static Future<Response> addproduct({
    required String productName,
    required String productPrice,
    required String productQuantity,
    required String productImage,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "product_name": productName,
      "product_price" : productPrice,
      "product_quantity": productQuantity,
      "product_image" : imageURL,
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Product Added Successfully";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }



  static Stream<QuerySnapshot> readproduct() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }

}