import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_mobile/auth.dart';
import 'package:firebase_authentication_mobile/first_screen.dart';
import 'package:firebase_authentication_mobile/homepage.dart';
import 'package:firebase_authentication_mobile/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  static const String idScreen = "RegisterScreen";
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  var authHandler = new Auth();
  @override
  Widget build(BuildContext context) {
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: userNameController,
      decoration: InputDecoration(
        hintText: 'username',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );
     final name = TextFormField(
      controller: nameController,
      decoration: InputDecoration(
        hintText: 'Nama',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        shadowColor: Colors.greenAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            if(nameController.text.length < 4){
              displaytoastmsg("Nama Harus lebih dari 4 karakter", context);
            }
            else if (!userNameController.text.contains("@"))
            {
              displaytoastmsg("Email addres tidak valid", context);
            } 
            else if (passwordController.text.length < 6)
            {
              displaytoastmsg("Password harus lebih dari 6 karakter", context);
            }
            else {registeNewUser(context);}
            
          },
          color: Colors.lightBlueAccent,
          child: Text('Register', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 8.0),
            name,
            SizedBox(height: 24.0),
            loginButton,
          ],
        ),
      ),
    );
  }

  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registeNewUser(BuildContext context) async
  {
   authHandler
              .handleSignUp(userNameController.text, passwordController.text)
              .then((User user) {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new HomePage()));
          }).catchError((errMsg){
      displaytoastmsg("Error : " + errMsg.toString(), context);
    });
    displaytoastmsg("User Berhasil Dibuat " , context);
  }

  displaytoastmsg(String message, BuildContext context){
    Fluttertoast.showToast(msg: message);
  }
}


