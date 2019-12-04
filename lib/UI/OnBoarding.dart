import 'package:flutter/material.dart';
import 'package:shooops/Library/intro_views_flutter-2.4.0/lib/Models/page_view_model.dart';
import 'package:shooops/Library/intro_views_flutter-2.4.0/lib/intro_views_flutter.dart';
import 'package:shooops/UI/LoginOrSignup/ChoseLoginOrSignup.dart';


class OnBoarding extends StatefulWidget {
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

var _fontHeaderStyle = TextStyle(
  fontFamily: "Popins",
  fontSize: 21.0,
  fontWeight: FontWeight.w800,
  color: Colors.black87,
  letterSpacing: 1.5
);

var _fontDescriptionStyle = TextStyle(
  fontFamily: "Sans",
  fontSize: 15.0,
  color: Colors.black26,
  fontWeight: FontWeight.w400
);
bool onboarding = false;
///
/// Page View Model for on boarding
///


final pages = [
  new PageViewModel(
      pageColor:  Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'All Type Service Available',style: _fontHeaderStyle,
      ),
      body: Container(
        height: 250.0,
        child: Text(
          'Hey Finding Any Service \nSo Why Your Are Waiting Let Go To Shop',textAlign: TextAlign.center,
          style: _fontDescriptionStyle
        ),
      ),
      mainImage: Image.asset(
        'assets/imgIllustration/IlustrasiOnBoarding1.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      )),

  new PageViewModel(
      pageColor:  Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Choose Item',style: _fontHeaderStyle,
      ),
      body: Container(
        height: 250.0,
        child: Text(
            'Safe To buy Product Easy Way!',textAlign: TextAlign.center,
            style: _fontDescriptionStyle
        ),
      ),
      mainImage: Image.asset(
        'assets/imgIllustration/IlustrasiOnBoarding2.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      )),

  new PageViewModel(
      pageColor:  Colors.white,
      iconColor: Colors.black,
      bubbleBackgroundColor: Colors.black,
      title: Text(
        'Buy Item',style: _fontHeaderStyle,
      ),
      body: Container(
        height: 250.0,
        child: Text(
            'Shop What Your Searching And Get In\n Relable Prices ',textAlign: TextAlign.center,
            style: _fontDescriptionStyle
        ),
      ),
      mainImage: Image.asset(
        'assets/imgIllustration/IlustrasiOnBoarding3.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      )),

];

 
class _OnBoardingState extends State<OnBoarding> {
//  final FirebaseAuth auth = FirebaseAuth.instance;

//   final GoogleSignIn googleSignIn = GoogleSignIn();

//   SharedPreferences sharedPreferences;

//   bool loading = false;

//   bool islogedin = false;

// @override
// void initState() { 
//   super.initState();
//  isSigned();
// }
// void isSigned() async {
//     setState(() {
//       loading = true;
//     });
//     sharedPreferences = await SharedPreferences.getInstance();
//     islogedin = await googleSignIn.isSignedIn();
//     if (islogedin) {
//       Navigator.of(context).pushReplacement(PageRouteBuilder(
//           pageBuilder: (_, __, ___) => new ChoseLogin()));
//     } else {
//      islogedin = false;
//     }
//   }

  @override
  Widget build(BuildContext context) {
   
    return IntroViewsFlutter(
      pages,
      pageButtonsColor: Colors.black45,
      skipText: Text("SKIP",style: _fontDescriptionStyle.copyWith(color: Colors.deepPurpleAccent,fontWeight: FontWeight.w800,letterSpacing: 1.0),),
      doneText: Text("DONE",style: _fontDescriptionStyle.copyWith(color: Colors.deepPurpleAccent,fontWeight: FontWeight.w800,letterSpacing: 1.0),),
      onTapDoneButton: (){
        setState(() {
          return onboarding = true;
        });
        Navigator.of(context).pushReplacement(PageRouteBuilder(pageBuilder: (_,__,___)=> new ChoseLogin(),
        transitionsBuilder: (_,Animation<double> animation,__,Widget widget){
          return Opacity(
            opacity: animation.value,
            child: widget,
          );
        },
        transitionDuration: Duration(milliseconds: 1500),
        ));
      },
    );
  }
}

