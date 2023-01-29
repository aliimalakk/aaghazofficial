import 'package:aaghazofficial/profile.dart';
import 'package:aaghazofficial/signin.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'home.dart';

import 'auth_services.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({Key? key}) : super(key: key);

  @override
  State<PersonalDetails> createState() => _PersonalDetailsScreen();
}

class _PersonalDetailsScreen extends State<PersonalDetails> {

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
                            padding: const EdgeInsets.only(left:16.0,top: 60),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Personal Details',style: TextStyle(color: Colors.black,fontSize: 36,fontFamily: 'Oxanium',),),
                                ),
                                Icon(Icons.person,size: 36,color: Colors.deepOrangeAccent,),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                              child: Padding(
                                padding: const EdgeInsets.only(left:16.0,top: 60),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:12.0,top: 4),
                                      child: Text('Name:',style: TextStyle(color: Colors.black,fontSize: 24,fontFamily: 'Poppins',),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:12.0,top:6),
                                      child: Text('Ali Malik',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Oxanium',),),
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
                                padding: const EdgeInsets.only(left:16.0,top: 40),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:12.0,top: 4),
                                      child: Text('Email:',style: TextStyle(color: Colors.black,fontSize: 24,fontFamily: 'Poppins',),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:12.0,top:6),
                                      child: Text('email',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Oxanium',),),
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
                                padding: const EdgeInsets.only(left:16.0,top: 40),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:12.0,top: 4),
                                      child: Text('Phone No: ',style: TextStyle(color: Colors.black,fontSize: 24,fontFamily: 'Poppins',),),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:12.0,top:6),
                                      child: Text('03059587905',style: TextStyle(color: Colors.black,fontSize: 20,fontFamily: 'Oxanium',),),
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
