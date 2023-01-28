
import 'package:aaghazofficial/auth_services.dart';
import 'package:aaghazofficial/home.dart';
import 'package:aaghazofficial/main.dart';
import 'package:aaghazofficial/main2.dart';
import 'package:aaghazofficial/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';




class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInScreen();
}


class _SignInScreen extends State<SignIn> {

  String? _error;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _globalKey=GlobalKey<ScaffoldState>();
 final storage = new FlutterSecureStorage();

  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Aaghaz Store',

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _globalKey,
        backgroundColor: Colors.deepOrangeAccent,
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent

        ),
        body: SafeArea(
            child: Stack(
              children: [
                 Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/background_1.png"),
                      fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.2),
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
                              padding: const EdgeInsets.only(top:48),
                              child: Center(
                                child: Container(

                                  child: Image(
                                    width: 160,
                                    image: AssetImage('assets/logo_v2.png'),


                                  ),

                                ),
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(top:36.0),
                              child: Form(
                                key: _formKey,
                                child: Padding(
                                  padding: const EdgeInsets.only(left:20,right: 20,top: 10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[



                                      Padding(
                                        padding: const EdgeInsets.only(top: 6),
                                        child: TextFormField(
                                          controller:_emailController ,
                                          decoration:  InputDecoration(
                                            filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.only(left:12, right: 12),
                                                child: const Icon(Icons.email, color: Colors.deepOrangeAccent,size: 35,),
                                              ),
                                              hintText: 'Enter Your Email',

                                              labelText: 'Email',
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
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
                                          controller:_passwordController ,
                                          obscureText: true,
                                          decoration:  InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.only(left:12, right: 12),
                                                child: const Icon(Icons.password_rounded, color: Colors.deepOrangeAccent,size: 35,),
                                              ),
                                              hintText: 'Enter Your Password',
                                              labelText: 'Password',
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
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
                                       padding: const EdgeInsets.only(right:140.0,top: 8),
                                       child: Text('Forgot Password?',style: TextStyle(fontSize: 14,color: Colors.deepOrange, fontWeight: FontWeight.bold),),
                                     ),





                                      Padding(
                                        padding: const EdgeInsets.only(top:60),
                                        child: Container(
                                          height: 44,
                                          width: 172,
                                          decoration: BoxDecoration(
                                              color: Colors.deepOrangeAccent,
                                              borderRadius:  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.3),
                                                  spreadRadius: 5,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                )
                                              ]
                                          ),

                                          child: InkWell(
                                            child: Center(child: Text('Sign In', style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),),
                                            onTap: () {
                                              if (_formKey.currentState!.validate()) {
                                                // If the form is valid, display a Snackbar.
                                                print(_emailController.text);
                                                print(_passwordController.text);
                                                _Signin();



                                              }

                                            },
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top:12),
                                        child: Container(
                                          height: 44,
                                          width: 172,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.3),
                                                  spreadRadius: 5,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                )
                                              ]
                                          ),

                                          child: InkWell(
                                            child: Center(child: Text('Create New Account', style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),),
                                            onTap: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                                            },
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top:36),
                                        child: Container(
                                          height: 40,
                                          width: 280,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.3),
                                                  spreadRadius: 5,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                )
                                              ]
                                          ),
                                         child: Stack(
                                           children: [
                                             InkWell(
                                              child: Stack(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:50, top:8),
                                                    child: Image(

                                                      image: AssetImage('assets/googlelogo.png'),


                                                    ),
                                                  ),
                                                   Padding(
                                                     padding: const EdgeInsets.only(left:100.0, top: 12),
                                                     child: Text('Sign Up With Google', style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
                                                   ),

                                                ],

                                              ),
                                               onTap: () {
                                                _handleSignIn();
                                               },
                                             ),
                                           ],
                                         ),

                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top:12),
                                        child: Container(
                                          height: 40,
                                          width: 280,
                                          decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:  BorderRadius.circular(20),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black.withOpacity(0.3),
                                                  spreadRadius: 5,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3),
                                                )
                                              ]
                                          ),
                                          child: Stack(
                                            children: [
                                              InkWell(
                                                child: Stack(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:50, top:8),
                                                      child: Image(

                                                        image: AssetImage('assets/facebooklogo.png'),


                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:100.0, top: 12),
                                                      child: Text('Sign Up With Facebook', style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w500),),
                                                    ),

                                                  ],

                                                ),
                                                onTap: () {

                                                },
                                              ),
                                            ],
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

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );
  Future<void> _handleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      try {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
        });
      } catch (e) {


      }
    } catch (e) {
      print(e);

    }
  }




  Future<void> _Signin()  async {
    try {
     UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text);
     await storage.write(key: 'uid', value: userCredential.user?.uid);

        Navigator.push(context, MaterialPageRoute(builder: (context)=>Main2()));

    } catch (e) {
      print(e);
      setState(() {
      });
    }
  }
}


