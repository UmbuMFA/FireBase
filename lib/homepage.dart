import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_authentication_mobile/login_page.dart';
import 'package:firebase_authentication_mobile/auth.dart';
import 'package:firebase_authentication_mobile/login_page.dart';
import 'package:firebase_authentication_mobile/register.dart';

class HomePage extends StatelessWidget {
 var authHandler = new Auth();
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue[100], Colors.blue[400]],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // CircleAvatar(
              //   backgroundImage: NetworkImage(
              //     imageUrl,
              //   ),
              //   radius: 60,
              //   backgroundColor: Colors.transparent,
              // ),
              SizedBox(height: 40),
              // Text(
              //   'NAME',
              //   style: TextStyle(
              //       fontSize: 15,
              //       fontWeight: FontWeight.bold,
              //       color: Colors.black54),
              // ),
              // Text(
              //   auth.currentUser.,
              //   style: TextStyle(
              //       fontSize: 25,
              //       color: Colors.deepPurple,
              //       fontWeight: FontWeight.bold),
              // ),
              SizedBox(height: 20),
              Text(
                'EMAIL',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54),
              ),
              Text(
                auth.currentUser.email,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }), ModalRoute.withName('/'));
                },
                color: Colors.deepPurple,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Sign Out',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
