import 'package:aaghazofficial/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'signin.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Start());
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => StartScreen();
}



class StartScreen extends State<Start> {
  // This widget is the root of your application.
  final storage = new FlutterSecureStorage();
  Future<bool> checkLoginStatus() async {
    String? value = await storage.read(key: 'uid');
    if (value==null)
    {
      return false;
    }
    return true;
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: checkLoginStatus(), builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.data == false)
        {
          return SignIn();
        }
        if (snapshot.connectionState == ConnectionState.waiting)
        {
          return Container(
            color: Colors.white,
            child: Center(child: CircularProgressIndicator(),),
          );
        }
        return Home();
      },
      ),
    );
  }
}
