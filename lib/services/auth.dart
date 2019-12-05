import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shooops/models/user.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';


class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final fblogin = FacebookLogin();
  final GoogleSignIn googleSignIn = GoogleSignIn();
  SharedPreferences sharedPreferences;
  User usersFromFirebase(FirebaseUser user) {

    
    if (user != null) {
      return User(
          uid: user?.uid,
          imageUrl: user?.photoUrl,
          name: user?.displayName,
          emailId: user?.email);
    } else {
      return null;
    }
  }

  // stream users
  Stream<User> get user {
    return auth.onAuthStateChanged.map(usersFromFirebase);
  }

  // ! ananomy as gust
  Future signAnon() async {
    try {
      final result = await auth.signInAnonymously();
      FirebaseUser user = result.user;
      assert(user.isAnonymous != null);
      return true;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // ! Google SignIn
  Future googleSignin() async {
    FirebaseUser currentUser;
    try {
      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      AuthResult result = await auth.signInWithCredential(credential);
      FirebaseUser user = result.user;
      assert(user.email != null);
      assert(user.displayName != null);
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      print(currentUser);
      print("User Name : ${currentUser.displayName}");
    } catch (e) {
      print(e.toString());
      return currentUser;
    }
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
      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      return 'signInWithGoogle succeeded: $user';
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// ! Signin with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      assert(user != null);
      assert(await user.getIdToken() != null);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //! gooogle signinnnn

  Future signinn() async {
    sharedPreferences = await SharedPreferences.getInstance();
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    AuthResult authResult = await auth.signInWithCredential(credential);
    FirebaseUser user = authResult.user;
    if (authResult != null) {
      final QuerySnapshot results = await Firestore.instance
          .collection("path")
          .where("id", isEqualTo: user.uid)
          .getDocuments();
      final List<DocumentSnapshot> documents = results.documents;
      if (documents.length == 0) {
        Firestore.instance.collection("users").document(user.uid).setData({
          "id": user.uid,
          "username": user.displayName,
          "photo": user.photoUrl
        });
        await sharedPreferences.setString("id", user.uid);
        await sharedPreferences.setString("username", user.displayName);
        await sharedPreferences.setString("photo", user.photoUrl);
      } else {
        await sharedPreferences.setString("id", documents[0]["id"]);
        await sharedPreferences.setString("username", documents[0]["username"]);
        await sharedPreferences.setString("photo", documents[0]["photo"]);
      }
      Fluttertoast.showToast(msg: 'login sucessed');
    }
  }

  Future<bool> signInWithGoogleeee() async {
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
      assert(user.email != null);
      assert(user.displayName != null);
      assert(user.photoUrl != null);
      if (authResult != null) {
        final QuerySnapshot results = await Firestore.instance
            .collection("path")
            .where("id", isEqualTo: user.uid)
            .getDocuments();
        final List<DocumentSnapshot> documents = results.documents;

        if (documents.length == 0) {
          Firestore.instance.collection("users").document(user.uid).setData({
            "id": user.uid,
            "username": user.displayName,
            "photo": user.photoUrl
          });

          // await sharedPreferences.setString("id", user.uid);
          // await sharedPreferences.setString("username", user.displayName);
          // await sharedPreferences.setString("photo", user.photoUrl);
        } else {
          print("hello");
          // await sharedPreferences.setString("id", documents[0]["id"]);
          // await sharedPreferences.setString(
          //     "username", documents[0]["username"]);
          // await sharedPreferences.setString("photo", documents[0]["photo"]);
        }
      }
      final FirebaseUser currentUser = await auth.currentUser();
      assert(user.uid == currentUser.uid);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  // ! register with email and password
  Future<bool> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthResult result = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);
      if (result != null) {
        final QuerySnapshot results = await Firestore.instance
            .collection("path")
            .where("id", isEqualTo: user.uid)
            .getDocuments();
        final List<DocumentSnapshot> documents = results.documents;
        if (documents.length == 0) {
          Firestore.instance.collection("users").document(user.uid).setData({
            "Register By": "registerWithEmailAndPassword",
            "id": user.uid,
            "Email": user.email,
            "photo": user.isEmailVerified
          });

          // await sharedPreferences.setString("id", user.uid);
          // await sharedPreferences.setString("Email", user.email);
          // await sharedPreferences.setString("photo", user.email);
        } else {
          // await sharedPreferences.setString("id", documents[0]["id"]);
          // await sharedPreferences.setString("Email", documents[0]["Email"]);
          // await sharedPreferences.setString("photo", documents[0]["photo"]);
        }

        // Fluttertoast.showToast(msg: 'SignUp sucessed');
      }
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

// ! reset password
  Future<bool> resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      return true;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future emailError(String email) async {
    try {
      return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  //! data load
 dataload() async {

  final ss = auth.signInAnonymously(); 
  try {
    if (ss != null) {
      return true;} 
  } catch (e) {
    print(e.toString());
    return false;
  }
}
  // ! facebook login
  Future facebookLogin() async {
    FirebaseUser currentUser;
    // fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    // if you remove above comment then facebook login will take username and pasword for login in Webview

    try {
      final FacebookLoginResult facebookLoginResult =
          await fblogin.logIn(['email', 'public_profile']);
      if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
        FacebookAccessToken facebookAccessToken =
            facebookLoginResult.accessToken;
        final AuthCredential credential = FacebookAuthProvider.getCredential(
            accessToken: facebookAccessToken.token);
            fblogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
        final FirebaseUser user =
            (await auth.signInWithCredential(credential)).user;
        assert(user.email != null);
        assert(user.displayName != null);
        assert(!user.isAnonymous);
        if (facebookLoginResult != null) {
          final QuerySnapshot results = await Firestore.instance
              .collection("path")
              .where("id", isEqualTo: user.uid)
              .getDocuments();
          final List<DocumentSnapshot> documents = results.documents;

          if (documents.length == 0) {
            Firestore.instance.collection("users").document(user.uid).setData({
              "Register By": "facebook",
              "id": user.uid,
              "Email": user.email,
              "photo": user.photoUrl,
              "phoneNumber": user.phoneNumber,
            });

            // await sharedPreferences.setString("id", user.uid);
            // await sharedPreferences.setString("Email", user.email);
            // await sharedPreferences.setString("photo", user.email);
          } else {
            // await sharedPreferences.setString("id", documents[0]["id"]);
            // await sharedPreferences.setString("Email", documents[0]["Email"]);
            // await sharedPreferences.setString("photo", documents[0]["photo"]); 
             Fluttertoast.showToast(msg: 'login sucessed');
          }

        
        }
        assert(await user.getIdToken() != null);
        currentUser = await auth.currentUser();
        assert(user.uid == currentUser.uid);
        return true;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  // !signout for anomn
  Future signOut() async {
    try {
      await fblogin.logOut();
      await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
