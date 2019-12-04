import 'package:flutter/material.dart';
import 'package:shooops/UI/BottomNavigationBar.dart';
import 'package:shooops/UI/OnBoarding.dart';
import 'package:provider/provider.dart';
import 'package:shooops/models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    //  ! return ethier Home or auth widget
    if (user == null) {
      return OnBoarding();
    } else {
      return bottomNavigationBar();
    }
    
  }
}
