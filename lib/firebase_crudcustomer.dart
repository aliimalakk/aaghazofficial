import 'package:cloud_firestore/cloud_firestore.dart';
import 'response.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('Customer');

class FirebaseCrud {

  static Future<Response> addcustomer({
    required String customerName,
    required String customerEmail,
    required String customerContact,
    required String role,
  }) async {

    Response response = Response();
    DocumentReference documentReferencer =
    _Collection.doc();

    Map<String, dynamic> data = <String, dynamic>{
      "customer_name": customerName,
      "customer_email" : customerEmail,
      "contact": customerContact,
      "role": role,
    };

    var result = await documentReferencer
        .set(data)
        .whenComplete(() {
      response.code = 200;
      response.message = "Signed Up Sucessfully";
    })
        .catchError((e) {
      response.code = 500;
      response.message = e;
    });

    return response;
  }



  static Stream<QuerySnapshot> readcustomer() {
    CollectionReference notesItemCollection =
        _Collection;

    return notesItemCollection.snapshots();
  }

}