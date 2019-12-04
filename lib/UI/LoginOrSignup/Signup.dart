import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shooops/UI/BottomNavigationBar.dart';
// import 'package:shooops/UI/bottomNavigationBar.dart';
import 'package:shooops/UI/LoginOrSignup/Login.dart';
import 'package:shooops/services/auth.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> with TickerProviderStateMixin {
  //Animation Declaration
  AnimationController sanimationController;
  AnimationController animationControllerScreen;
  Animation animationScreen;
  var tap = 0;

  String email = "";
  String password = "";
  String error = "";
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();

  /// Set AnimationController to initState
  @override
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

  /// Dispose animationController
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

  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  /// Component Widget layout UI
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    mediaQueryData.devicePixelRatio;
    mediaQueryData.size.height;
    mediaQueryData.size.width;

    return Scaffold(
      // resizeToAvoidBottomPadding: false,/
      body: Stack(
        children: <Widget>[
          Container(
            /// Set Background image in layout
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/img/backgroundgirl.png"),
              fit: BoxFit.cover,
            )),
            child: Container(
              /// Set gradient color in image
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(0, 0, 0, 0.2),
                    Color.fromRGBO(0, 0, 0, 0.3)
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                ),
              ),

              /// Set component layout
              child: ListView(
                padding: EdgeInsets.all(0.0),
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
                                        top:
                                            mediaQueryData.padding.top + 40.0)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Image(
                                      image: AssetImage("assets/img/Logo.png"),
                                      height: 70.0,
                                    ),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0)),

                                    /// Animation text CityGrow shop accept from login layout
                                    Hero(
                                      tag: "CityGrow",
                                      child: Text(
                                        "CityGrow Shop",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 0.6,
                                            fontFamily: "Sans",
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 30.0)),
                                ButtonCustomFacebook(),

                                /// ButtonCustomGoogle
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 7.0)),
                                ButtonCustomGoogle(),

                                /// Set Text
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0)),
                                Text(
                                  "OR",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      color: Colors.white,
                                      letterSpacing: 0.2,
                                      fontFamily: 'Sans',
                                      fontSize: 17.0),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0)),

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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Container(
                                          height: 60.0,
                                          alignment:
                                              AlignmentDirectional.center,
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
                                                      keyboardType:
                                                          TextInputType
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
                                                      decoration:
                                                          InputDecoration(
                                                              contentPadding:
                                                                  new EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          5.0,
                                                                      horizontal:
                                                                          0.0),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              labelText:
                                                                  "Email",
                                                              icon: Icon(
                                                                Icons.email,
                                                                color: Colors
                                                                    .black38,
                                                              ),
                                                              labelStyle: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  fontFamily:
                                                                      'Sans',
                                                                  letterSpacing:
                                                                      0.3,
                                                                  color: Colors
                                                                      .black38,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
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
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.0),
                                        child: Container(
                                          height: 60.0,
                                          alignment:
                                              AlignmentDirectional.center,
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
                                                      decoration:
                                                          InputDecoration(
                                                              contentPadding:
                                                                  new EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          5.0,
                                                                      horizontal:
                                                                          0.0),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              labelText:
                                                                  "Password",
                                                              icon: Icon(
                                                                Icons.vpn_key,
                                                                color: Colors
                                                                    .black38,
                                                              ),
                                                              labelStyle: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  fontFamily:
                                                                      'Sans',
                                                                  letterSpacing:
                                                                      0.3,
                                                                  color: Colors
                                                                      .black38,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
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

                                /// TextFromField Password
                                // TextFromField(
                                //   email: "password",
                                //   icon: Icons.vpn_key,
                                //   validator: (val) => val.length < 6
                                //       ? "Enter Six Digit Password"
                                //       : null,
                                //   password: true,
                                //   onChanged: (val) {
                                //     setState(() {
                                //       password = val;
                                //     });
                                //   },
                                // ),

                                /// Button Login
                                FlatButton(
                                    padding: EdgeInsets.only(top: 20.0),
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  new LoginScreen()));
                                    },
                                    child: Text(
                                      " Have Acount? Sign In",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: "Sans"),
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: InkWell(
                                      onTap: () async {
                                        if (_formkey.currentState.validate()) {
                                          bool result = await _authService
                                              .registerWithEmailAndPassword(
                                                  email, password);
                                          if (result != false) {
                                            Fluttertoast.showToast(
                                                msg: "SignUp Done");
                                            return Navigator.of(context)
                                                .pushReplacement(PageRouteBuilder(
                                                    pageBuilder: (_, __, ___) =>
                                                        new bottomNavigationBar()));
                                          }
                                          if (result == false) {
                                            setState(() {
                                              Fluttertoast.showToast(
                                                  msg:
                                                      "Fill Your Form Properly");
                                            });
                                          }
                                        }
                                      },
                                      child: ButtonBlackBottom()),
                                ),

                                // RaisedButton.icon(
                                //   color: Colors.purple[700],
                                //   textColor: Colors.white,
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius:
                                //           new BorderRadius.circular(12.0),
                                //       side: BorderSide(color: Colors.white)),
                                //   label: Text("SignUp"),
                                //   icon: Icon(Icons.keyboard_tab),
                                //   onPressed: () {},
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      /// Set Animaion after user click buttonLogin
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
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

    final AuthService auth = AuthService();

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
        child: InkWell(
          onTap: ()async{
              final result = await auth.facebookLogin();
                if (result != null) {
                  Fluttertoast.showToast(msg: "Sucessfull Login!!");
                  return Navigator.of(context).pushReplacement(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new bottomNavigationBar()));
                } else if (result == null) {
                  Fluttertoast.showToast(msg: "Samething Went Wrong!");
                }
          },
                  child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/img/icon_facebook.png",
                height: 25.0,
              ),
              Padding(padding: EdgeInsets.symmetric(horizontal: 7.0)),
              Text(
                "Login With Facebook",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Sans'),
              ),
            ],
          ),
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
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Padding(
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
        child: InkWell(
          onTap: ()async{
                 dynamic result = await _authService.signInWithGoogleeee();
        if (result == null) {
          setState(() {
            Fluttertoast.showToast(msg: "Oops! Samething went wrong!");
          });
        } else {
          Navigator.of(context).pushReplacement(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new bottomNavigationBar()));
          Fluttertoast.showToast(msg: "Succesfull Sign In");
        }
          },
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
          "Sign Up",
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
