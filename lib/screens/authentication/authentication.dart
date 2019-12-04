import 'package:flutter/material.dart';
import 'package:shooops/screens/authentication/register.dart';
import 'package:shooops/screens/authentication/signin.dart';
// import 'package:login/screens/authentication/signin.dart';

class Authentication extends StatefulWidget {
  Authentication({Key key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  bool showSignIn = true;
  void toggleview(){
    setState(() {
     showSignIn = !showSignIn; 
    });
  }
  @override
  Widget build(BuildContext context) {
   if (showSignIn) {
      return SignIn(toggleview: toggleview,);
    } else {
      return Register(toggleview: toggleview,);
    }
  }
}