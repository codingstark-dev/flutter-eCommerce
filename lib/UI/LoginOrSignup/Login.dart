import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shooops/UI/AcountUIComponent/Profile.dart';
import 'package:shooops/UI/BottomNavigationBar.dart';
import 'package:shooops/UI/LoginOrSignup/Signup.dart';
import 'package:shooops/UI/LoginOrSignup/resetpassword.dart';
import 'package:shooops/services/auth.dart';

// import '../bottomNavigationBar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

/// Component Widget this layout UI
class _LoginScreenState extends State<LoginScreen>
    with TickerProviderStateMixin {
  //Animation Declaration
  AnimationController sanimationController;

  var tap = 0;
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;
  bool isLoggedIn = false;
  final AuthService _authService = AuthService();

  @override

  /// set state animation controller
  void initState() {
    sanimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800))
          ..addStatusListener((statuss) {
            if (statuss == AnimationStatus.dismissed) {
              setState(() {
                tap = 0;
              });
            }
          });

    // TODO: implement initState
    super.initState();
  }

  /// Dispose animation controller
  @override
  void dispose() {
    super.dispose();
    sanimationController.dispose();
  }

  /// Playanimation set forward reverse
  Future<Null> playAnimation() async {
    try {
      await sanimationController.forward();
      await sanimationController.reverse();
    } on TickerCanceled {}
  }

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.width;
    mediaQueryData.size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        /// Set Background image in layout (Click to open code)
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/img/loginscreenbackground.png"),
          fit: BoxFit.cover,
        )),
        child: Container(
          /// Set gradient color in image (Click to open code)
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 0, 0, 0.0),
                Color.fromRGBO(0, 0, 0, 0.3)
              ],
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
            ),
          ),

          /// Set component layout
          child: ListView(
            children: <Widget>[
              // Align(
              //   alignment: Alignment.bottomCenter,
              //                 child: ConnectionStatusBar(
              //     width: double.maxFinite,
              //     height: 25,
              //     animationDuration: const Duration(milliseconds: 200),
              //     lookUpAddress: "google.com",
              //     endOffset: const Offset(0.0, 0.0),
              //     beginOffset: const Offset(0.0, -1.0),
              //     // default title
              //     title: Text(
              //       'Please check your internet connection',
              //       style: TextStyle(color: Colors.white, fontSize: 14),
              //     ),
              //     color: Colors.redAccent, // default color
              //   ),
              // ),
              Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: Column(
                          children: <Widget>[
                            /// padding logo
                            Padding(
                                padding: EdgeInsets.only(
                                    top: mediaQueryData.padding.top + 40.0)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image(
                                  image: AssetImage("assets/img/Logo.png"),
                                  height: 70.0,
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.0)),

                                /// Animation text CityGrow shop accept from signup layout (Click to open code)
                                Hero(
                                  tag: "CityGrow",
                                  child: Text(
                                    "CityGrow Shop",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 0.6,
                                        color: Colors.white,
                                        fontFamily: "Sans",
                                        fontSize: 20.0),
                                  ),
                                ),
                              ],
                            ),

                            /// ButtonCustomFacebook
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 30.0)),
                            ButtonCustomFacebook(),

                            /// ButtonCustomGoogle
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 7.0)),
                            ButtonCustomGoogle(),

                            /// Set Text
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0)),
                            Text(
                              "OR",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  letterSpacing: 0.2,
                                  fontFamily: 'Sans',
                                  fontSize: 17.0),
                            ),

                            /// TextFromField Email

                            /// TextFromField Password
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0)),

                            /// TextFromField Email
                            // TextFromField(
                            //   onChanged: (val) {
                            //     setState(() {
                            //       email = val;
                            //     });
                            //   },
                            //   validator: (val) =>
                            //       val.isEmpty ? "Enter An Email" : null,
                            //   icon: Icons.email,
                            //   password: false,
                            //   email: "Email",
                            //   inputType: TextInputType.emailAddress,
                            // ),
                            // Padding(
                            //     padding:
                            //         EdgeInsets.symmetric(vertical: 5.0)),
                            Form(
                              key: _formkey,
                              child: Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Container(
                                      height: 60.0,
                                      alignment: AlignmentDirectional.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10.0,
                                                color: Colors.black12)
                                          ]),
                                      padding: EdgeInsets.only(
                                          left: 20.0,
                                          right: 30.0,
                                          top: 0.0,
                                          bottom: 0.0),
                                      child: Theme(
                                        data: ThemeData(
                                          hintColor: Colors.transparent,
                                        ),
                                        child: Container(
                                          child: Column(
                                            children: <Widget>[
                                              Flexible(
                                                child: TextFormField(
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      email = val;
                                                    });
                                                  },
                                                  validator: (val) =>
                                                      val.isEmpty
                                                          ? "Enter An Email"
                                                          : null,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          new EdgeInsets
                                                                  .symmetric(
                                                              vertical: 5.0,
                                                              horizontal: 0.0),
                                                      border: InputBorder.none,
                                                      labelText: "Email",
                                                      icon: Icon(
                                                        Icons.email,
                                                        color: Colors.black38,
                                                      ),
                                                      labelStyle: TextStyle(
                                                          fontSize: 15.0,
                                                          fontFamily: 'Sans',
                                                          letterSpacing: 0.3,
                                                          color: Colors.black38,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.0),
                                    child: Container(
                                      height: 60.0,
                                      alignment: AlignmentDirectional.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 10.0,
                                                color: Colors.black12)
                                          ]),
                                      padding: EdgeInsets.only(
                                          left: 20.0,
                                          right: 30.0,
                                          top: 0.0,
                                          bottom: 0.0),
                                      child: Theme(
                                        data: ThemeData(
                                          hintColor: Colors.transparent,
                                        ),
                                        child: Container(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: <Widget>[
                                              Flexible(
                                                child: TextFormField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  obscureText: true,
                                                  onChanged: (val) {
                                                    setState(() {
                                                      password = val;
                                                    });
                                                  },
                                                  validator: (val) => val
                                                              .length <
                                                          6
                                                      ? "Enter Six Digit Password"
                                                      : null,
                                                  decoration: InputDecoration(
                                                      contentPadding:
                                                          new EdgeInsets
                                                                  .symmetric(
                                                              vertical: 5.0,
                                                              horizontal: 0.0),
                                                      border: InputBorder.none,
                                                      labelText: "Password",
                                                      icon: Icon(
                                                        Icons.vpn_key,
                                                        color: Colors.black38,
                                                      ),
                                                      labelStyle: TextStyle(
                                                          fontSize: 15.0,
                                                          fontFamily: 'Sans',
                                                          letterSpacing: 0.3,
                                                          color: Colors.black38,
                                                          fontWeight:
                                                              FontWeight.w600)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            FlatButton(
                                // padding: EdgeInsets.only(top: 20.0),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              ResetPassword()));
                                },
                                child: Text(
                                  "Reset Your Password!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Sans"),
                                )),
                            Text(
                              "OR",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.white,
                                  letterSpacing: 0.2,
                                  fontFamily: 'Sans',
                                  fontSize: 17.0),
                            ),

                            /// Button Signup
                            FlatButton(
                                // padding: EdgeInsets.only(top: 20.0),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new Signup()));
                                },
                                child: Text(
                                  "Not Have Acount? Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: "Sans"),
                                )),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: mediaQueryData.padding.top + 70.0,
                                  bottom: 0.0),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  /// Set Animaion after user click buttonLogin
                  Container(
                    child: InkWell(
                        onTap: () async {
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              loading = true;
                            });
                            dynamic result = await _authService
                                .signInWithEmailAndPassword(email, password);

                            Fluttertoast.showToast(msg: "Wait! Loading...");
                            if (result == true) {
                              Fluttertoast.showToast(msg: "Successfull Login");
                              return Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          new bottomNavigationBar()));
                            }
                            if (result == false) {
                              setState(() {
                                Fluttertoast.showToast(
                                    msg: "Could Not SignIn With Email");
                                loading = false;
                              });
                            }
                          }
                        },
                        child: ButtonBlackBottom()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// textfromfield custom class
class TextFromField extends StatefulWidget {
  TextFromField(
      {this.email,
      this.icon,
      this.inputType,
      this.password,
      this.validator,
      this.onChanged});

  String email;
  IconData icon;
  TextInputType inputType;
  Function onChanged;
  bool password;
  Function validator;

  @override
  _TextFromFieldState createState() => _TextFromFieldState();
}

class _TextFromFieldState extends State<TextFromField> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        height: 60.0,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 10.0, color: Colors.black12)]),
        padding:
            EdgeInsets.only(left: 20.0, right: 30.0, top: 0.0, bottom: 0.0),
        child: Theme(
          data: ThemeData(
            hintColor: Colors.transparent,
          ),
          child: Form(
            key: _formkey,
            child: TextFormField(
              onChanged: widget.onChanged,
              validator: widget.validator,
              obscureText: widget.password,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: widget.email,
                  icon: Icon(
                    widget.icon,
                    color: Colors.black38,
                  ),
                  labelStyle: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Sans',
                      letterSpacing: 0.3,
                      color: Colors.black38,
                      fontWeight: FontWeight.w600)),
              keyboardType: widget.inputType,
            ),
          ),
        ),
      ),
    );
  }
}

///ButtonCustomFacebook class
class ButtonCustomFacebook extends StatefulWidget {
  @override
  _ButtonCustomFacebookState createState() => _ButtonCustomFacebookState();
}

class _ButtonCustomFacebookState extends State<ButtonCustomFacebook> {
  // bool isLoggedIn = false;

  //  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {
  //   setState(() {

  //     this.isLoggedIn = isLoggedIn;
  //   });
  // }

  // void initiateFacebookLogin() async {
  //   var facebookLogin = FacebookLogin();
  //   var facebookLoginResult = await facebookLogin.logIn(['email']);
  //   switch (facebookLoginResult.status) {
  //     case FacebookLoginStatus.error:
  //       print("Error");
  //       onLoginStatusChanged(false);
  //       break;
  //     case FacebookLoginStatus.cancelledByUser:
  //       print("CancelledByUser");
  //       onLoginStatusChanged(false);
  //       break;
  //     case FacebookLoginStatus.loggedIn:
  //       print("LoggedIn");
  //       onLoginStatusChanged(true);
  //       break;
  //       case FacebookLoginStatus.loggedIn:
  // print("LoggedIn");

  // var graphResponse = await http.get(
  // 'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${facebookLoginResult
  // .accessToken.token}');

  // var profile = json.decode(graphResponse.body);
  // print(profile.toString());

  // onLoginStatusChanged(true, profileData: profile);
  // break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        alignment: FractionalOffset.center,
        height: 49.0,
        width: 500.0,
        decoration: BoxDecoration(
          color: Color.fromRGBO(107, 112, 248, 1.0),
          borderRadius: BorderRadius.circular(40.0),
          boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 15.0)],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/img/icon_facebook.png",
              height: 25.0,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 7.0)),
            InkWell(
              onTap: () async {
                final result = await AuthService().facebookLogin();
                if (result != null) {
                  Fluttertoast.showToast(msg: "Sucessfull Login!!");
                  return Navigator.of(context).pushReplacement(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new bottomNavigationBar()));
                } else if (result == null) {
                  Fluttertoast.showToast(msg: "Samething Went Wrong!");
                }
              },
              child: Text(
                "Login With Facebook",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Sans'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///ButtonCustomGoogle class
class ButtonCustomGoogle extends StatefulWidget {
  @override
  _ButtonCustomGoogleState createState() => _ButtonCustomGoogleState();
}

class _ButtonCustomGoogleState extends State<ButtonCustomGoogle> {
  // final FirebaseAuth auth = FirebaseAuth.instance;
  // final GoogleSignIn googleSignIn = GoogleSignIn();
  // bool islogedin = false;
  // bool loading = false;
  // SharedPreferences sharedPreferences;

  final AuthService _authService = AuthService();

  // void isSigned() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   islogedin = await googleSignIn.isSignedIn();
  //   if (islogedin) {
  //     Navigator.of(context).pushReplacement(PageRouteBuilder(
  //         pageBuilder: (_, __, ___) => new bottomNavigationBar()));
  //   } else {}
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   isSigned();
  // }

  // Future signin() async {
  //   sharedPreferences = await SharedPreferences.getInstance();
  //   setState(() {
  //     loading = true;
  //   });

  //   GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  //   GoogleSignInAuthentication googleSignInAuthentication =
  //       await googleSignInAccount.authentication;
  //   AuthCredential credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleSignInAuthentication.accessToken,
  //     idToken: googleSignInAuthentication.idToken,
  //   );
  //   AuthResult authResult = await auth.signInWithCredential(credential);
  //   FirebaseUser user = authResult.user;
  //   if (authResult != null) {
  //     final QuerySnapshot results = await Firestore.instance
  //         .collection("path")
  //         .where("id", isEqualTo: user.uid)
  //         .getDocuments();
  //     final List<DocumentSnapshot> documents = results.documents;
  //     if (documents.length == 0) {
  //       Firestore.instance.collection("users").document(user.uid).setData({
  //         "id": user.uid,
  //         "username": user.displayName,
  //         "photo": user.photoUrl
  //       });
  //       await sharedPreferences.setString("id", user.uid);
  //       await sharedPreferences.setString("username", user.displayName);
  //       await sharedPreferences.setString("photo", user.photoUrl);
  //     } else {
  //       await sharedPreferences.setString("id", documents[0]["id"]);
  //       await sharedPreferences.setString("username", documents[0]["username"]);
  //       await sharedPreferences.setString("photo", documents[0]["photo"]);
  //     }
  //     Fluttertoast.showToast(msg: 'login sucessed');
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  // }

  // Future<String> signInWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount googleSignInAccount =
  //         await googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.getCredential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     final AuthResult authResult = await auth.signInWithCredential(credential);
  //     final FirebaseUser user = authResult.user;
  //     assert(!user.isAnonymous);
  //     assert(await user.getIdToken() != null);
  //     if (authResult != null) {
  //       final QuerySnapshot results = await Firestore.instance
  //           .collection("path")
  //           .where("id", isEqualTo: user.uid)
  //           .getDocuments();
  //       final List<DocumentSnapshot> documents = results.documents;
  //       if (documents.length == 0) {
  //         Firestore.instance.collection("users").document(user.uid).setData({
  //           "id": user.uid,
  //           "username": user.displayName,
  //           "photo": user.photoUrl
  //         });
  //         await sharedPreferences.setString("id", user.uid);
  //         await sharedPreferences.setString("username", user.displayName);
  //         await sharedPreferences.setString("photo", user.photoUrl);
  //       } else {
  //         await sharedPreferences.setString("id", documents[0]["id"]);
  //         await sharedPreferences.setString(
  //             "username", documents[0]["username"]);
  //         await sharedPreferences.setString("photo", documents[0]["photo"]);
  //       }
  //       Fluttertoast.showToast(msg: 'login sucessed');
  //       setState(() {
  //         loading = false;
  //       });
  //     }
  //     final FirebaseUser currentUser = await auth.currentUser();
  //     assert(user.uid == currentUser.uid);
  //     return 'signInWithGoogle succeeded: $user';
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        dynamic result = await _authService.signInWithGoogleeee();
        if (result == false) {
          setState(() {
            Fluttertoast.showToast(msg: "Oops! Samething went wrong!");
          });
        } else {
          Navigator.of(context).pushReplacement(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new bottomNavigationBar()));
          Fluttertoast.showToast(msg: "Succesfull Sign In");
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Container(
          alignment: FractionalOffset.center,
          height: 49.0,
          width: 500.0,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10.0)],
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/img/google.png",
                height: 25.0,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 7.0)),
              Text(
                "Login With Google",
                style: TextStyle(
                    color: Colors.black26,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Sans'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///ButtonBlack class
class ButtonBlackBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(30.0),
      child: Container(
        height: 55.0,
        width: 600.0,
        child: Text(
          "Login",
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 0.2,
              fontFamily: "Sans",
              fontSize: 18.0,
              fontWeight: FontWeight.w800),
        ),
        alignment: FractionalOffset.center,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15.0)],
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: <Color>[Color(0xFF121940), Color(0xFF6E48AA)])),
      ),
    );
  }
}
