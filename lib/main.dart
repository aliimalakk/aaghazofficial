import 'package:aaghazofficial/adminMain.dart';
import 'package:aaghazofficial/home.dart';
import 'package:aaghazofficial/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'main2.dart';
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
  Future<Object> checkLoginStatus() async {
    String? value = await storage.read(key: 'uid');
    String? value1 = await storage.read(key: 'email');
    Map<String, String> allValues = await storage.readAll();
    print(allValues);



    if (value==null)
    {
      return false;
    }else {
      if (allValues=='{uid: 4CnDLEdpXIbSPBd778cPHJe6Pvw2}')
      {return value;}
      else {
        return true;
      }
    }

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
        else if (snapshot.data == true)
        {
          return Main2();
        }
        return AdminMain();
      },
      ),
    );
  }
}
