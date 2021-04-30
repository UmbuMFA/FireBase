import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_mobile/auth.dart';
import 'package:firebase_authentication_mobile/homepage.dart';
import 'package:firebase_authentication_mobile/register.dart';
import 'package:firebase_authentication_mobile/sign_in.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_authentication_mobile/first_screen.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var authHandler = new Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(size: 150),

               SizedBox(height: 1,),
               TextFormField(
                controller: userNameController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(fontSize: 14),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  )
                ),
               ),

               SizedBox(height: 1,),
               TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  labelStyle: TextStyle(fontSize: 14),
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  )
                ),
               ),
              SizedBox(height: 10),
              _signInButtonEmail(),
              SizedBox(height: 10),
              _signInButton(),
              FlatButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              }, child: Text(
                "Do you have any accaount? Register Register here")),
            ],
          ),
        ),
      ),
    );
  }


Widget _signInButtonEmail() {
    return RaisedButton(
      color: Colors.yellow,
      textColor: Colors.white,
      child:Container(
        height: 50,
        child: Center(
          child: Text(
            "Login With Email"),),
      ),
      shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(24.0)
      ),
      onPressed: ()  {
        authHandler
              .handleSignInEmail(userNameController.text, passwordController.text)
              .then((User user) {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new HomePage()));
          }).catchError((e) => print(e));
      },
    );
  }

  


  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return FirstScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image(image: AssetImage("assets/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

// final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
// void loginAndCatchUserAuth(BuildContext context) async {
//     final User firebaseUser = (await _firebaseAuth
//       .signInWithEmailAndPassword(email: userNameController.text, password: passwordController.text).catchError((errMsg){
//       displaytoastmsg("Error : " + errMsg.toString(), context);
//     })).user;

//     if(firebaseUser != null)//user created
//     {
//       userRef.child(firebaseUser.uid).once().then((value) => (DataSnapshot snap){
//         if(snap.value != null){
//           Navigator.pushAndRemoveUntil(context, FirstScreen.idScreen , (route) => false);
//           displaytoastmsg("Anda telah Login ", context);
//         } else {
//           _firebaseAuth.signOut();
//           displaytoastmsg("User tidak Cocok silahkan coba lagi atau buat akun baru ", context);
//         }
//       });
      
//       } else {
//         displaytoastmsg("Error Tidak bisa Login", context);
//       }
// }

}