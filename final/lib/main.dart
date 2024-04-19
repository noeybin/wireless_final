import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project1/firebase_options.dart';
import 'package:project1/pages/EditProfilePage.dart';
import 'package:project1/pages/HomePage.dart';
import 'package:project1/pages/LoginPage.dart';
import 'package:project1/pages/RegisterPage.dart';
import 'package:project1/pages/Launcher.dart';
import 'package:project1/pages/ProfilePage.dart';
import 'package:project1/pages/foodPage0.dart';
import 'package:project1/pages/foodPage1.dart';
import 'package:project1/pages/foodPage2.dart';
import 'package:project1/pages/foodPage3.dart';
import 'package:project1/pages/foodPage4.dart';
import 'package:project1/pages/Foodlist.dart';
import 'package:project1/pages/Savedlist.dart';
import 'package:project1/pages/AboutPage.dart';
import 'package:project1/pages/Popuplogout.dart';

/*void main() {
  runApp(MyApp());
}*/

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure plugins are initialized
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions
        .currentPlatform, // Only if you're using FlutterFire CLI
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
// This widget is the root of your application .
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Workshop1',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/profile': (context) => ProfilePage(),
        '/editprofile': (context) => EditProfilePage(),
        '/launcher': (context) => Launcher(),
        '/food0': (context) => FoodPage0(),
        '/food1': (context) => FoodPage1(),
        '/food2': (context) => FoodPage2(),
                '/food3': (context) => FoodPage3(),
        '/food4': (context) => FoodPage4(),
        '/foodlist': (context) => Foodlist(),
        '/Savedlist': (context) => Savedlist(),
        '/aboutus': (context) => AboutPage(),
        '/poplogout': (context) => poplogout(),
      },
    );
  }
}
