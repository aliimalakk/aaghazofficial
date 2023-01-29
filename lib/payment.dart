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

class Payments extends StatefulWidget {
  const Payments({Key? key}) : super(key: key);

  @override
  State<Payments> createState() => _Payments();
}

class _Payments extends State<Payments> {

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
                            padding: const EdgeInsets.only(left:72.0,top: 60),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Payments',style: TextStyle(color: Colors.black,fontSize: 36,fontFamily: 'Oxanium',),),
                                ),
                                Icon(Icons.payment_rounded,size: 36,color: Colors.deepOrangeAccent,),
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
