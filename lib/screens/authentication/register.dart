import 'package:flutter/material.dart';
import 'package:shooops/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleview;

  Register({this.toggleview});

  @override
  _RegisterState createState() => _RegisterState();
}


class _RegisterState extends State<Register> {
  String email = "";
  String password = "";
  String error = "";
  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Sign Up"),
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Sign In"),
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
                keyboardType: TextInputType.emailAddress,
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
                child: Text("Sign up"),
                textColor: Colors.white,
                onPressed: () async {
                  if (_formkey.currentState.validate()) {
                    dynamic result = await _authService
                        .registerWithEmailAndPassword(email, password);
                    if (result == null) {
                      setState(() {
                        error = "Please set vaild email";
                      });
                    }
                  }
                },
              ),
              Text(
                error,
                style: TextStyle(fontSize: 15, color: Colors.red),
              ),
              FlatButton(
              color: Colors.amber,
              textColor: Colors.white,
          child: Text("SignAnomo"),
          onPressed: ()async {
           dynamic result = await _authService.signAnon();
           if (result == null) {
             print("error signin");
           } else {
             print("Signed");
             print(result.uid);
           }
          },
        )
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
