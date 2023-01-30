
import 'dart:io';

import 'package:aaghazofficial/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_crud.dart';
import 'firebase_crudproduct.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'firebase_crudproduct.dart';




class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelScreen();
}


class _AdminPanelScreen extends State<AdminPanel> {

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _globalKey=GlobalKey<ScaffoldState>();
  final storage = new FlutterSecureStorage();
  String imageURL = '';

  TextEditingController _nameProduct=new TextEditingController();
  TextEditingController _priceProduct=new TextEditingController();
  TextEditingController _quantityProduct=new TextEditingController();
  TextEditingController _decProduct=new TextEditingController();



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Aaghaz Store',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _globalKey,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(left:110.0),
            child: Text('Admin Panel',style: TextStyle(color: Colors.white,fontFamily: 'Oxanium',fontSize: 24),),
          ),

          backgroundColor: Colors.black,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.logout,
                color: Colors.yellow,
              ),
              onPressed: () async {

                await FirebaseAuth.instance.signOut();
                await storage.delete(key: 'uid');
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));

              },
            )
          ],
        ),
        body: SafeArea(

          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background_3.png"),
                    fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.5),
                        BlendMode.darken,
                      )

                  ),
                ),

              ),
              Builder(
                  builder: (context) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:60),
                            child: Center(
                              child: Container(

                                child: Image(
                                  width: 200,
                                  image: AssetImage('assets/logo.png'),


                                ),

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:16.0),
                            child: Text('Create New Product', style: TextStyle(fontSize: 28,fontFamily: 'Poppins',color: Colors.white),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:16.0),
                            child: Text('Please Fill In The Information Below', style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: 'Oxanium'),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:12.0),
                            child: Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  // crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[

                                    TextFormField(
                                      controller:_nameProduct,
                                      decoration:  InputDecoration(

                                          prefixIcon: Padding(
                                            padding: const EdgeInsets.only(left: 12,right: 12),
                                            child: const Icon(Icons.drive_file_rename_outline, color: Colors.yellow,size: 35,),
                                          ),
                                          hintText: 'Enter Product Name',
                                          labelText: 'Product Name',
                                          labelStyle: TextStyle(
                                            color: Colors.white70
                                            ,
                                            fontSize: 16,
                                          ),


                                          border: OutlineInputBorder(
                                              borderSide: const BorderSide(width: 1, color: Colors.white),
                                              borderRadius: BorderRadius.circular(10)

                                          ),
                                          focusedErrorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1),

                                          ) ,
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.red, width: 1),

                                          )
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: TextFormField(
                                        controller:_priceProduct ,
                                        decoration:  InputDecoration(
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(left:12, right: 12),
                                              child: const Icon(Icons.price_change_rounded, color: Colors.yellow,size: 35,),
                                            ),
                                            hintText: 'Enter Product Price',
                                            labelText: 'Product Price',
                                            labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),


                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(width: 1, color: Colors.black),
                                                borderRadius: BorderRadius.circular(10)

                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.red, width: 1),

                                            ) ,
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.red, width: 1),

                                            )
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter valid email';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: TextFormField(
                                        controller:_quantityProduct,
                                        decoration:  InputDecoration(
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(left:12, right: 12),
                                              child: const Icon(Icons.production_quantity_limits, color: Colors.yellow,size: 35,),
                                            ),
                                            hintText: 'Enter Product Quantity',
                                            labelText: 'Product Quantity',
                                            labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),


                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(width: 1, color: Colors.black),
                                                borderRadius: BorderRadius.circular(10)

                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.red, width: 1),

                                            ) ,
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.red, width: 1),

                                            )
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter valid password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                      child: TextFormField(
                                        controller:_decProduct,
                                        decoration:  InputDecoration(
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(left:12, right: 12),
                                              child: const Icon(Icons.description, color: Colors.yellow,size: 35,),
                                            ),
                                            hintText: 'Enter Product Description',
                                            labelText: 'Product Description',
                                            labelStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),


                                            border: OutlineInputBorder(
                                                borderSide: const BorderSide(width: 1, color: Colors.black),
                                                borderRadius: BorderRadius.circular(10)

                                            ),
                                            focusedErrorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.red, width: 1),

                                            ) ,
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(color: Colors.red, width: 1),

                                            )
                                        ),
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Please enter valid password';
                                          }
                                          return null;
                                        },
                                      ),
                                    ),


                                    /*Padding(
                                      padding: const EdgeInsets.only(top: 12),
                                     child: Container(
                                       height: 60,
                                       width: 360,

                                       decoration: BoxDecoration(
                                         borderRadius: BorderRadius.circular(8.0),
                                         color: Colors.black,
                                       ),
                                       child: Row(
                                         children: [
                                            Padding(
                                              padding: const EdgeInsets.only(left:60.0),
                                              child: Text('Upload Image:',style: TextStyle(color: Colors.white,fontSize: 24,fontFamily: 'Oxanium',),),
                                            ),
                                           IconButton(
                                             onPressed: () async {

                                               ImagePicker imagePicker = ImagePicker();
                                               XFile? file = await imagePicker.pickImage(source: ImageSource.camera);
                                               if (file==null) return;
                                               String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
                                               Reference referenceRoot = FirebaseStorage.instance.ref();
                                               Reference referenceDirImages = referenceRoot.child('images');
                                               Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
                                               try{
                                                 await referenceImageToUpload.putFile(File(file!.path));

                                                 imageURL= await referenceImageToUpload.getDownloadURL();
                                               }catch(error){

                                               }


                                             }, icon: Icon(Icons.camera_alt_rounded,color: Colors.yellow,),
                                           ),
                                         ],
                                       ),
                                     ),
                                    ),
                           */         SizedBox(height: 30.0),
                                    Material(
                                      elevation: 5.0,
                                      borderRadius: BorderRadius.circular(20.0),
                                      color: Colors.white,
                                      child: MaterialButton(
                                        minWidth: 150,
                                        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                                        onPressed: () async {
                                         /* if (imageURL.isEmpty)
                                            {
                                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Upload an Image')));
                                            }*/

                                          if (_formKey.currentState!.validate()) {

                                            var response = await FirebaseCrud.addproduct(
                                              productName: _nameProduct.text,
                                              productPrice: _priceProduct.text,
                                              productQuantity: _quantityProduct.text,
                                              productDec: _decProduct.text,
                                            );
                                            if (response.code != 200) {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Text(response.message.toString()),
                                                    );
                                                  });
                                            } else {
                                              showDialog(
                                                  context: context,
                                                  builder: (context) {
                                                    return AlertDialog(
                                                      content: Text(response.message.toString()),
                                                    );
                                                  });
                                            }
                                          }
                                        },
                                        child: Text(
                                          "Add",
                                          style: TextStyle(color: Colors.black,fontSize: 20),
                                          textAlign: TextAlign.center,
                                        ),

                                      ),

                                    ),












                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }
              ),

            ],
          ),

        ),

      ),
    );

  }






}
