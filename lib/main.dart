import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_authentication_mobile/first_screen.dart';
import 'package:firebase_authentication_mobile/register.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => LoginPage(),
        RegisterPage.idScreen: (context) => RegisterPage(),
        '/FirstScreen' : (context) => FirstScreen(),
      },
    );
  }
}
