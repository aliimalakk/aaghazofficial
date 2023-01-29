
import 'package:aaghazofficial/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firebase_crud.dart';
import 'firebase_crudcustomer.dart';




class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpScreen();
}


class _SignUpScreen extends State<SignUp> {

  DatabaseReference dbRef = FirebaseDatabase.instance.ref();
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _globalKey=GlobalKey<ScaffoldState>();

  TextEditingController _nameController=new TextEditingController();
  TextEditingController _phoneController=new TextEditingController();
  TextEditingController _emailController=new TextEditingController();
  TextEditingController _passwordController=new TextEditingController();



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Aaghaz Store',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        key: _globalKey,
        appBar: AppBar(

            backgroundColor: Colors.deepOrangeAccent,
          leading:IconButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));}, icon: Icon(Icons.arrow_back_rounded),),
        ),
        body: SafeArea(

          child: Stack(
              children: [
          Container(
          decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/background_2.png"),
          fit: BoxFit.cover,

        ),
      ),

    ),
                Builder(
                    builder: (context) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:20),
                              child: Center(
                                child: Container(

                                  child: Image(
                                    width: 140,
                                    image: AssetImage('assets/logo_v2.png'),


                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:16.0),
                              child: Text('Create New Account', style: TextStyle(fontSize: 22,fontWeight: FontWeight.w500),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:20.0),
                              child: Text('Please Fill In The Information Below', style: TextStyle(fontSize: 12,fontWeight: FontWeight.normal),),
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
                                        controller:_nameController ,
                                        decoration:  InputDecoration(

                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.only(left: 12,right: 12),
                                              child: const Icon(Icons.person, color: Colors.deepOrangeAccent,size: 35,),
                                            ),
                                            hintText: 'Enter Your Full Name',
                                            labelText: 'Full Name',
                                            labelStyle: TextStyle(
                                              color: Colors.grey,
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
                                            return 'Please enter some text';
                                          }
                                          return null;
                                        },
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: TextFormField(
                                          controller:_emailController ,
                                          decoration:  InputDecoration(
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.only(left:12, right: 12),
                                                child: const Icon(Icons.email, color: Colors.deepOrangeAccent,size: 35,),
                                              ),
                                              hintText: 'Enter Your Email',
                                              labelText: 'Email',
                                              labelStyle: TextStyle(
                                                color: Colors.grey,
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
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.only(left:12, right: 12),
                                                child: const Icon(Icons.password_rounded, color: Colors.deepOrangeAccent,size: 35,),
                                              ),
                                              hintText: 'Enter Your Password',
                                              labelText: 'Password',
                                              labelStyle: TextStyle(
                                                color: Colors.grey,
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
                                        padding: const EdgeInsets.only(top: 12),
                                        child: TextFormField(
                                          controller:_phoneController ,
                                          decoration:  InputDecoration(
                                              prefixIcon: Padding(
                                                padding: const EdgeInsets.only(left:12, right: 12),
                                                child: const Icon(Icons.phone, color: Colors.deepOrangeAccent,size: 35,),
                                              ),
                                              hintText: 'Enter Your Phone Number',
                                              labelText: 'Phone Number',
                                              labelStyle: TextStyle(
                                                color: Colors.grey,
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
                                              return 'Please enter some text';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                  SizedBox(height: 30.0),
                                  Material(
                                    elevation: 5.0,
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: Color(0xFFFF6E40),
                                       child: MaterialButton(
                                        minWidth: 150,
                                        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
                                        onPressed: () async {
                                          sign_up();
                                          if (_formKey.currentState!.validate()) {

                                            var response = await FirebaseCrud.addcustomer(
                                              customerName: _nameController.text,
                                              customerEmail: _emailController.text,
                                              customerContact: _phoneController.text,
                                              role: "customer",);
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
                                          "Sign Up",
                                          style: TextStyle(color: Colors.white,fontSize: 20),
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


  Future<void> sign_up() async {



    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text)
          .then((value) {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
        print('Done');
      });
    } catch (e) {
      print(e);
    }

  }



}
