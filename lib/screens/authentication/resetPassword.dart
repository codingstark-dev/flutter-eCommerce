
import 'package:flutter/material.dart';
import 'package:shooops/services/auth.dart';


class ResetPassword extends StatefulWidget {
  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  String email = " ";
  String error = "";
  String error1 = "";

  final AuthService _authService = AuthService();
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Reset Password"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
        elevation: 0,
        
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
              RaisedButton(
                  color: Colors.pink,
                  child: Text("Reset Now!"),
                  textColor: Colors.white,
                  onPressed: () async {
                    // if (_formkey.currentState.validate()) {
                    //   // dynamic result = await _authService.resetPassword(email);
                    //   dynamic emailerror = await _authService.emailError(email);

                    //   if (result == null && emailerror == false) {
                    //     setState(() {
                    //       error = "Please set vaild email";
                    //     });
                    //   }else{
                    //     setState(() {
                    //        error = "Done!!!!!!!!!!";
                    //     });
                    //   }
                      
                    // }
          }),
              Text(
                error,
                style: TextStyle(fontSize: 15, color: Colors.red),
              ),
              Text(
                error1,
                style: TextStyle(fontSize: 15, color: Colors.green),
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

