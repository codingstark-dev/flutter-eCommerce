import 'dart:async';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shooops/services/auth.dart';

import 'Login.dart';

class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

/// Component Widget this layout UI
class _ResetPasswordState extends State<ResetPassword>
    with TickerProviderStateMixin {
  //Animation Declaration
  AnimationController sanimationController;

  var tap = 0;
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
  bool loading = false;
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
      resizeToAvoidBottomPadding: false,
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
                            // Padding(
                            //     padding: EdgeInsets.symmetric(vertical: 30.0)),
                            // ButtonCustomFacebook(),

                            // /// ButtonCustomGoogle
                            // Padding(
                            //     padding: EdgeInsets.symmetric(vertical: 7.0)),
                            // ButtonCustomGoogle(),

                            // /// Set Text
                            // Padding(
                            //     padding: EdgeInsets.symmetric(vertical: 10.0)),
                            // Text(
                            //   "OR",
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.w900,
                            //       color: Colors.white,
                            //       letterSpacing: 0.2,
                            //       fontFamily: 'Sans',
                            //       fontSize: 17.0),
                            // ),

                            /// TextFromField Email

                            /// TextFromField Password
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 5.0)),
                            Padding(
                                padding: EdgeInsets.symmetric(vertical: 10.0)),
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
                                ],
                              ),
                            ),
                            // FlatButton(
                            //     // padding: EdgeInsets.only(top: 20.0),
                            //     onPressed: () {
                            //       Navigator.of(context).pushReplacement(
                            //           MaterialPageRoute(
                            //               builder: (BuildContext context) =>
                            //                   new Signup()));
                            //     },
                            //     child: Text(
                            //       "Reset Your Password!",
                            //       style: TextStyle(
                            //           color: Colors.white,
                            //           fontSize: 13.0,
                            //           fontWeight: FontWeight.w600,
                            //           fontFamily: "Sans"),
                            //     )),
                            //     Padding(
                            //       padding: const EdgeInsets.all(2.0),
                            //       child: Text("Or",style: TextStyle(color: Colors.white,fontSize: 17),),
                            //     ),

                            /// Button Signup
                            FlatButton(
                                // padding: EdgeInsets.only(top: 20.0),
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              new LoginScreen()));
                                },
                                child: Text(
                                  "Return To SignIn!",
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
                        onTap: () async{
                          if (_formkey.currentState.validate()) {
                            _formkey.currentState.save();
                            try {
                              final result =
                                  await _authService.resetPassword(email);
                              if (result != false) {
                                return Fluttertoast.showToast(
                                    msg: "Done! Check Your Mail Box");
                              } else if (result == false) {
                                return Fluttertoast.showToast(
                                  msg:
                                      "Please Check your Email Is Correct Or SignUp!!",
                                );
                              }
                            } catch (e) {
                              print(e.toString());
                              return true;
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
          "Reset Password",
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
