import 'package:aaghazofficial/home.dart';
import 'package:aaghazofficial/signin.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'auth_services.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesScreen();
}

class _CategoriesScreen extends State<Categories> {

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
          padding: const EdgeInsets.all(6),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 330,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: AssetImage('assets/categories_1.png'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.darken,
                            )
                        ),
                      ),
                        child: InkWell(
                          child:Center(child: Text('MEN',style: TextStyle(color: Colors.white,fontSize: 32,fontFamily: 'Poppins',),),),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                        ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 330,
                      width: 180,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: AssetImage('assets/categories_2.png'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.darken,
                            )
                        ),
                      ),
                      child: InkWell(
                        child: Center(child: Text('WOMEN',style: TextStyle(color: Colors.white,fontSize: 32,fontFamily: 'Poppins',),),),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 330,
                      width: 180,
                      child: InkWell(
                        child: Center(child: Text('KIDS',style: TextStyle(color: Colors.white,fontSize: 32,fontFamily: 'Poppins',),),),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: AssetImage('assets/categories_3.png'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.darken,
                            )
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 330,
                      width: 180,
                      child: InkWell(
                        child: Center(child: Text('ON SALE',style: TextStyle(color: Colors.white,fontSize: 32,fontFamily: 'Poppins',),),),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                        },
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: AssetImage('assets/categories_4.png'),
                            fit: BoxFit.cover,
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.5),
                              BlendMode.darken,
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),


        ) ,



      ),


    );
  }

}
