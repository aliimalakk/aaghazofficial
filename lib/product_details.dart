import 'package:aaghazofficial/signin.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_services.dart';
import 'cart.dart';
import 'home.dart';
const List<String> list = <String>['X-L', 'L', 'M', 'S', 'X-S'];

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsScreen();
}

class _ProductDetailsScreen extends State<ProductDetails> {

  final storage = new FlutterSecureStorage();

  String dropdownValue = list.first;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aaghaz Store',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.deepOrangeAccent,
          leading:IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));}, icon: Icon(Icons.arrow_back_rounded),),
        ),
        body:


        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Builder(
              builder: (context) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          height: 380.0,
                          width: 390.0,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                            },
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0.0),
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/home_6.png'),
                              fit: BoxFit.cover,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                      Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:16.0,left:36),
                              child: Text('Orange Jacket',style: TextStyle(color: Colors.black,fontSize: 24,fontFamily: 'Oxanium',),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:16,left: 36),
                              child: Text('Rs.2999/-',style: TextStyle(color: Colors.black,fontSize: 24,fontFamily: 'Poppins',),),
                            ),
                          ],
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top:8,),
                          child: Container(
                            height: 1,
                            width: 340,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Center(
                           child:Padding(
                             padding: const EdgeInsets.only(left:28.0,right: 28,top: 12,bottom: 12),
                             child: RichText(text: TextSpan(
                               style: DefaultTextStyle.of(context).style,
                               children: <TextSpan> [
                                 TextSpan(text: 'Description: ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16)),
                                 TextSpan(text: 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English.'),
                               ]
                             )),
                           )

                      ),
   Center(
     child: Row(
       children: [
         Padding(
           padding: const EdgeInsets.only(left:100.0),
           child: Text('Select Size:',style: TextStyle(color: Colors.black,fontSize: 24,fontFamily: 'Oxanium',),),
         ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: DropdownButton<String>(
             value: dropdownValue,
             icon: const Icon(Icons.arrow_downward,size: 20,color: Colors.black,),
             elevation: 12,
             style: const TextStyle(color: Colors.deepPurple),
             underline: Container(
               height: 1,
               width: 10,
               color: Colors.black,
             ),
             onChanged: (String? value) {
               // This is called when the user selects an item.
               setState(() {
                 dropdownValue = value!;
               });
             },
             items: list.map<DropdownMenuItem<String>>((String value) {
               return DropdownMenuItem<String>(
                 value: value,
                 child: Text(value,style: TextStyle(fontSize: 20,color: Colors.deepOrangeAccent),),
               );
             }).toList(),
           ),
         ),
       ],
     ),
   ),
                      Padding(
                        padding: const EdgeInsets.only(top:20,bottom: 20),
                        child: Container(
                          height: 44,
                          width: 172,
                          decoration: BoxDecoration(
                              color: Colors.deepOrangeAccent,
                              borderRadius:  BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                )
                              ]
                          ),
                          child: InkWell(
                            child:Center(
                              child: Row(children: [
                                Padding(
                                  padding: const EdgeInsets.only(left:14.0),
                                  child: IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));}, icon: Icon(Icons.shopping_cart),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:0.0,),
                                  child: Center(child: Text('Add to Cart', style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),),
                                ),
                              ],),
                            ),
                            onTap: () {

                            },
                          ),
                        ),
                      ),

                    ],
                  ),
                );

              }
            ),
          ),


        ) ,



      ),


    );
  }

}
