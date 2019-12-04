import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shooops/UI/HomeUIComponent/Home.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginIn extends StatefulWidget {
  @override
  _LoginInState createState() => _LoginInState();
}

class _LoginInState extends State<LoginIn> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  SharedPreferences sharedPreferences;
  bool loading = false;
  bool islogedin = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSigned();
  }

  void isSigned() async {
    setState(() {
      loading = true;
    });
    sharedPreferences = await SharedPreferences.getInstance();
    islogedin = await googleSignIn.isSignedIn();
    if (islogedin) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => Menu()));
    } else {}
  }

  Future signin() async {
    sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      loading = true;
    });

    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    AuthResult authResult = await auth.signInWithCredential(credential);
       FirebaseUser user = authResult.user;
       
  }

  Future<String> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final AuthResult authResult = await auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      if (authResult != null) {
        final QuerySnapshot results  =  await Firestore.instance.collection("path").where("id", isEqualTo: user.uid).getDocuments();
        final List<DocumentSnapshot> documents = results.documents;
        if(documents.length == 0){
          Firestore.instance.collection("users").document(user.uid).setData({"id": user.uid,
          "username": user.displayName,
          "photo":  user.photoUrl}); 
           await sharedPreferences.setString("id", user.uid);
           await sharedPreferences.setString("username", user.displayName);
           await sharedPreferences.setString("photo", user.photoUrl);
         
        }else{
           await sharedPreferences.setString("id", documents[0]["id"]);
           await sharedPreferences.setString("username", documents[0]["username"]);
           await sharedPreferences.setString("photo", documents[0]["photo"]);
        }
      Fluttertoast.showToast(msg: 'login sucessed');
      setState(() {
        loading = false;
      });
      } else {}
      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      return 'signInWithGoogle succeeded: $user';
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
