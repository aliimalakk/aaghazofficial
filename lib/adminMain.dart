import 'package:aaghazofficial/home.dart';
import 'package:aaghazofficial/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'adminPanel.dart';
import 'main2.dart';
import 'signin.dart';



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(AdminMain());
}

class AdminMain extends StatefulWidget {
  const AdminMain({Key? key}) : super(key: key);

  @override
  State<AdminMain> createState() => _AdminScreen();
}



class _AdminScreen extends State<AdminMain> {
  // This widget is the root of your application.
  final storage = new FlutterSecureStorage();
  Future<Object> checkLoginStatus() async {
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
        return AdminPanel();
      },
      ),
    );
  }
}
