import 'package:cloud_firestore/cloud_firestore.dart';
import 'response.dart';
import 'adminPanel.dart';
String imageURL = '';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Product');


class FirebaseCrud {

  static Future<Response> addproduct({
    required String productName,
    required String productPrice,
    required String productQuantity,
    required String productDec,
  }) async {

    Response response = Response();
    print(response);
    DocumentReference documentReferencer =
    _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "product_name": productName,
      "product_price" : productPrice,
      "product_quantity": productQuantity,
      "product_dec" : productDec,
    };

_Collection.add(data);
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