
import 'package:flutter/material.dart';
import 'package:shooops/ListItem/HomeGridItemRecomended.dart';
import 'package:shooops/models/user.dart';
import 'package:shooops/screens/Wrapper.dart';
import 'package:shooops/services/auth.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          value: AuthService().user,
        ),
          Provider<AuthService>(builder: (context) => AuthService()),
          // Provider<FileData>(builder: (BuildContext context)=> FileData())
      ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Wrapper(),
          ),
    );
  }
}
