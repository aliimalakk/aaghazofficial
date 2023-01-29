import 'dart:ffi';

import 'package:aaghazofficial/categories.dart';
import 'package:aaghazofficial/product_details.dart';
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

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeScreen();
}

class _HomeScreen extends State<Home> {

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
        child: Builder(
          builder: (context) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                          style: BorderStyle.solid
                      ),

                    ),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 10,right: 8),
                              child: const Icon(Icons.search_sharp,color: Colors.deepOrangeAccent,size: 36,),
                            ),
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 0.0),
                              child: Container(
                                height: 20,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.deepOrangeAccent,
                                ),

                                child: IconButton(
                                  icon: const Icon(Icons.search,color: Colors.white,size: 20,),
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    await storage.delete(key: 'uid');
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                                  },
                                ),
                              ),
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey,fontSize: 20),
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top:100.0),
                    child: ListView(
                    children: [
                      CarouselSlider(
                        items: [

                          //1st Image of Slider
                          Container(
                            margin: EdgeInsets.all(0.0),
                            child: Center(child: Text('BEST PRICES',style: TextStyle(color: Colors.white,fontSize: 36,fontFamily: 'Poppins',),),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/home_1.png'),
                                fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.darken,
                                  )
                              ),
                            ),
                          ),

                          //2nd Image of Slider
                          Container(
                            margin: EdgeInsets.all(0.0),
                            child: Center(child: Text('UPTO 70% off',style: TextStyle(color: Colors.orange,fontSize: 36,fontFamily: 'Poppins'),),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/home_2.png'),
                                fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.darken,
                                  )
                              ),
                            ),
                          ),

                          //3rd Image of Slider
                          Container(
                            margin: EdgeInsets.all(0.0),
                            child: Center(child: Text('WINTER SALE',style: TextStyle(color: Colors.white,fontSize: 36,fontFamily: 'Poppins'),),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/home_3.png'),
                                fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.darken,
                                  )
                              ),
                            ),
                          ),

                          //4th Image of Slider
                          Container(
                            margin: EdgeInsets.all(0.0),
                            child: Center(child: Text('FLAT 50% off',style: TextStyle(color: Colors.orange,fontSize: 36,fontFamily: 'Poppins'),),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: AssetImage('assets/home_4.png'),
                                fit: BoxFit.cover,
                                  colorFilter: ColorFilter.mode(
                                    Colors.black.withOpacity(0.5),
                                    BlendMode.darken,
                                  )
                              ),
                            ),
                          ),

                          //5th Image of Slider
                          Container(
                            margin: EdgeInsets.all(0.0),
                            child: Center(child: Text('NEW ARRIVALS',style: TextStyle(color: Colors.white,fontSize: 36,fontFamily: 'Poppins'),),),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),

                              image: DecorationImage(
                                image: AssetImage('assets/home_5.png'),
                                fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
            )

                              ),

                            ),
                          ),

                        ],

                        //Slider Container properties
                        options: CarouselOptions(
                          height: 150.0,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                      ),
                    ],
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(top:280,left: 8,),
                  child: Text('Popular Products', style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:310.0,left:4),

                      child: SingleChildScrollView(
                        child: Column(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left:0.0,top: 16),
                              child: Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 160.0,
                                            width: 184.0,
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails()));
                                              },
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/home_6.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:5.0),
                                            child: Container(

                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Text('Orange Jacket',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Text('Rs. 2,999/-',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 160.0,
                                            width: 184.0,
                                            child: InkWell(
                                              onTap: () {

                                              },
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/home_7.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:5.0),
                                            child: Container(

                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Text('Denim Jacket',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Text('Rs. 2,999/-',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:0.0,top: 16),
                              child: Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 160.0,
                                            width: 184.0,
                                            child: InkWell(
                                              onTap: () {

                                              },
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/home_9.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:5.0),
                                            child: Container(

                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Text('Sweat Shirt',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Text('Rs. 2,999/-',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 160.0,
                                            width: 184.0,
                                            child: InkWell(
                                              onTap: () {

                                              },
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/home_8.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:5.0),
                                            child: Container(

                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Text('Sky-Blue T-Shirt',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Text('Rs. 2,999/-',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:0.0,top: 16),
                              child: Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 160.0,
                                            width: 184.0,
                                            child: InkWell(
                                              onTap: () {

                                              },
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/home_10.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:5.0),
                                            child: Container(

                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 40),
                                                    child: Text('Jeans',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Text('Rs. 2,999/-',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 160.0,
                                            width: 184.0,
                                            child: InkWell(
                                              onTap: () {

                                              },
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/home_11.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:5.0),
                                            child: Container(

                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Text('White Hoodie',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Text('Rs. 2,999/-',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:0.0,top: 16),
                              child: Center(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 160.0,
                                            width: 184.0,
                                            child: InkWell(
                                              onTap: () {

                                              },
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/home_12.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:5.0),
                                            child: Container(

                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Text('Fancy Jacket',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Text('Rs. 2,999/-',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 160.0,
                                            width: 184.0,
                                            child: InkWell(
                                              onTap: () {

                                              },
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15.0),
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/home_13.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              shape: BoxShape.rectangle,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:5.0),
                                            child: Container(

                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 10),
                                                    child: Text('Yelow T-Shirt',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Text('Rs. 2,999/-',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w900),),

                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),

                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),


                ),

              ],
            );
          }
        ),


          ) ,

        ),


    );
  }

}
