import 'package:aaghazofficial/profile.dart';
import 'package:aaghazofficial/signin.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_services.dart';

class YourOrders extends StatefulWidget {
  const YourOrders({Key? key}) : super(key: key);

  @override
  State<YourOrders> createState() => _YourOrders();
}

class _YourOrders extends State<YourOrders> {

  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aaghaz Store',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.deepOrangeAccent,
          leading:IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile()));}, icon: Icon(Icons.arrow_back_rounded),),
        ),
        body:


        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:40.0),
                  child: Center(
                    child: Container(

                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:56.0,top: 60),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Your Orders',style: TextStyle(color: Colors.black,fontSize: 36,fontFamily: 'Oxanium',),),
                                ),
                                Icon(Icons.shopping_cart,size: 36,color: Colors.deepOrangeAccent,),
                              ],
                            ),
                          ),



                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),


        ) ,



      ),


    );
  }

}
