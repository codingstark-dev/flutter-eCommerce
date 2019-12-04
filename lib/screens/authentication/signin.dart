import 'package:flutter/material.dart';
import 'package:shooops/screens/authentication/resetPassword.dart';
import 'package:shooops/services/auth.dart';
import 'package:shooops/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleview;

  SignIn({this.toggleview});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  dynamic loading = false;
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String error = "";
 


  @override
  Widget build(BuildContext context) {
 setState(() {
   
   
 });
    return loading ? LoadingScreen()  :Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Login"),
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("registers"),
            onPressed: () {
              widget.toggleview();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Form(
          key: _formkey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: true,
                validator: (val) => val.isEmpty ? "Enter An Email" : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                autofocus: true,
                validator: (val) =>
                    val.length < 6 ? "Enter Six Digit Password" : null,
                obscureText: true,
                onChanged: (val) {
                  setState(() {
                    password = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.pink,
                child: Text("Sign In"),
                textColor: Colors.white,
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    setState(() {
                      loading = true;
                    });
                    dynamic result = await _authService
                        .signInWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = "could not signIn with email";
                        loading = false;
                      });
                    }
                  }
                },
              ),
              SizedBox(
                height: 20,
              ),
              FlatButton(
                child: Text("reset password"),
                onPressed: () {
                  setState(() {
                    loading = true;
                  });
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => ResetPassword()));
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                onPressed: () async {
                  dynamic result = await _authService.signInWithGoogle();
                  if (result == null) {
                    setState(() {
                      error = "could not signIn with email";
                    });
                  }
                },
                color: Colors.amberAccent,
              ),
              Text(
                error,
                style: TextStyle(fontSize: 15, color: Colors.red),
              ),
            ],
          ),
        ),

        //! anomoysi sign in as gust
        //   alignment: Alignment.center,
        //     child: FlatButton(
        //       color: Colors.amber,
        //       textColor: Colors.white,
        //   child: Text("SignAnomo"),
        //   onPressed: ()async {
        //    dynamic result = await _authService.signAnon();
        //    if (result == null) {
        //      print("error signin");
        //    } else {
        //      print("Signed");
        //      print(result.uid);
        //    }
        //   },
        // )
      ),
    );
  }
}
