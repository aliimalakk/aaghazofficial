import 'dart:ffi';

import 'package:aaghazofficial/categories.dart';
import 'package:aaghazofficial/personal_details.dart';
import 'package:aaghazofficial/policy.dart';
import 'package:aaghazofficial/profile.dart';
import 'package:aaghazofficial/signin.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_services.dart';
import 'cart.dart';
import 'home.dart';

class Main2 extends StatefulWidget {
  const Main2({Key? key}) : super(key: key);

  @override
  State<Main2> createState() => _Main2Screen();
}

class _Main2Screen extends State<Main2> {

  final storage = new FlutterSecureStorage();
  int currentIndex = 0;
  final screens = [
    Home(),
    Categories(),
    Cart(),
    Profile(),
    Policy(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aaghaz Store',
      debugShowCheckedModeBanner: false,
      home: Scaffold(

        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),



        bottomNavigationBar:

        Builder(
            builder: (context) {
              return BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.deepOrangeAccent,
                  selectedItemColor: Colors.black,
                  unselectedItemColor: Colors.white,
                  iconSize: 36,
                  selectedFontSize: 14,
                  showUnselectedLabels: false,
                  currentIndex: currentIndex,
                  onTap: (index) => setState(() => currentIndex = index),
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled),
                        label: 'Home',
                        backgroundColor: Colors.deepOrangeAccent


                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.category_sharp),
                        label: 'Categories',
                        backgroundColor: Colors.deepOrangeAccent

                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart,size: 24,),
                        label: 'Cart',
                        backgroundColor: Colors.deepOrangeAccent


                    ),

                    BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile',
                        backgroundColor: Colors.deepOrangeAccent

                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.policy_sharp),
                        label: 'Policy',
                        backgroundColor: Colors.deepOrangeAccent

                    ),
                  ]);
            }
        ),

      ),


    );
  }

}
