import 'package:aaghazofficial/personal_details.dart';
import 'package:aaghazofficial/signin.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_services.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<Profile> {

  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aaghaz Store',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(

          backgroundColor: Colors.deepOrangeAccent,
        ),
        body:


        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:60.0),
                  child: Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:60.0),
                  child: Center(
                    child: Container(
            height: 410,
                      width: 360,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                       color: Color.fromRGBO(242, 101, 55, 0.2),
                          ),
                      child: Column(
                        children: [
                          Center(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,top: 40),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(Icons.person,color: Colors.deepOrangeAccent,size: 48,),
                                    ),
                                   Padding(
                                     padding: const EdgeInsets.only(left:12.0,top: 4),
                                     child: Text('Personal Details',style: TextStyle(color: Colors.black,fontSize: 28,fontFamily: 'Oxanium',),),
                                   ),
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>PersonalDetails()));}, icon: Icon(Icons.arrow_right,color: Colors.black,size: 36,shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 6.0)]),),
                                    ),
                                  ],

                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:10),
                              child:Center(
                                child: Container(
                                  height: 1,
                                  width: 320,
                                  color: Colors.black,
                                ),
                              )
                          ),
                          Center(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,top: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(Icons.shopping_cart,color: Colors.deepOrangeAccent,size: 48,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:12.0,top: 4),
                                      child: Text('Your Orders',style: TextStyle(color: Colors.black,fontSize: 28,fontFamily: 'Oxanium',),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:60.0),
                                      child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right,color: Colors.black,size: 36,shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 6.0)]),),
                                    ),
                                  ],

                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top:10,),
                              child: Container(
                                height: 1,
                                width: 320,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,top: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(Icons.favorite,color: Colors.deepOrangeAccent,size: 48,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:12.0,top: 4),
                                      child: Text('Favourites',style: TextStyle(color: Colors.black,fontSize: 28,fontFamily: 'Oxanium',),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:70.0),
                                      child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right,color: Colors.black,size: 36,shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 6.0)]),),
                                    ),
                                  ],

                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top:10,),
                              child: Container(
                                height: 1,
                                width: 320,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,top: 30),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Icon(Icons.payment,color: Colors.deepOrangeAccent,size: 48,),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:12.0,top: 4),
                                      child: Text('Payments',style: TextStyle(color: Colors.black,fontSize: 28,fontFamily: 'Oxanium',),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:75.0),
                                      child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right,color: Colors.black,size: 36,shadows: <Shadow>[Shadow(color: Colors.black, blurRadius: 6.0)]),),
                                    ),
                                  ],

                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top:10,),
                              child: Container(
                                height: 1,
                                width: 320,
                                color: Colors.black,
                              ),
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
