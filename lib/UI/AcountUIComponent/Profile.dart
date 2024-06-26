import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shooops/UI/AcountUIComponent/AboutApps.dart';
import 'package:shooops/UI/AcountUIComponent/CallCenter.dart';
import 'package:shooops/UI/AcountUIComponent/Message.dart';
import 'package:shooops/UI/AcountUIComponent/Notification.dart';
import 'package:shooops/UI/LoginOrSignup/ChoseLoginOrSignup.dart';
import 'package:shooops/UI/AcountUIComponent/CreditCardSetting.dart';
import 'package:shooops/UI/AcountUIComponent/MyOrders.dart';
import 'package:shooops/UI/AcountUIComponent/SettingAcount.dart';
import 'package:shooops/UI/LoginOrSignup/Signup.dart';
import 'package:shooops/models/user.dart';
import 'package:shooops/services/auth.dart';
import 'package:shooops/Api/ProductApi.dart';

class profil extends StatefulWidget {
  profil({this.username, this.emailIds, this.imageUrls});

  final String username;
  final String imageUrls;
  final String emailIds;
  @override
  _profilState createState() => _profilState();
}

// final AuthService auth = AuthService();
/// Custom Font
var _txt = TextStyle(
  color: Colors.black,
  fontFamily: "Sans",
);

/// Get _txt and custom value of Variable for Name User
var _txtName = _txt.copyWith(fontWeight: FontWeight.w700, fontSize: 17.0);

/// Get _txt and custom value of Variable for Edit text
var _txtEdit = _txt.copyWith(color: Colors.black26, fontSize: 15.0);

/// Get _txt and custom value of Variable for Category Text
var _txtCategory = _txt.copyWith(
    fontSize: 14.5, color: Colors.black54, fontWeight: FontWeight.w500);

class _profilState extends State<profil> {
  // _profilState({this.username,this.emailIds,this.imageUrls});

  // final String username;
  // final String imageUrls;
  // final String emailIds;
  var i = 0;

  @override
  Widget build(BuildContext context) {
    i++;
    print("rebuild $i");
    final User user = Provider.of<User>(context);
    final AuthService authService = Provider.of<AuthService>(context);

    /// Declare MediaQueryData
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    // String username;
    // String imageUrls;
    // String emailIds;

    // setState(() {
    //   username = user?.name;
    //   imageUrls = user?.imageUrl;
    //   emailIds = user?.emailId;
    // });

    final datas = profil(
      imageUrls: user?.imageUrl,
      username: (user?.name == "") ? null : user?.name,
      emailIds: (user?.emailId == "") ? null : user?.emailId,
    );

    /// To Sett PhotoProfile,Name and Edit Profile
    var _profile = Padding(
      padding: EdgeInsets.only(
        top: 185.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100.0,
                width: 100.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.5),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(datas.imageUrls ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqXzigtzoi2Md9v4AMfFNVAfwhXYlLxSYjxwXh3DPCm_4STJoz&s"),
                        fit: BoxFit.cover)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: buildText(datas.username, user),
              ),
              InkWell(
                onTap: () {
                  if (datas.emailIds == null) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Signup()));
                  } else if (datas.emailIds != null) {
                    Fluttertoast.showToast(msg: "Our Feature is Coming soon");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Text(
                    datas.emailIds ?? "Click Here To SignUp",
                    style: _txtEdit,
                  ),
                ),
              ),
              // FlatButton(
              //   child: Text("data"),
              //   onPressed: () {
              //   },
              // )
            ],
          ),
          Container(),
        ],
      ),
    );
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            /// Setting Header Banner
            Container(
              height: 240.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/img/headerProfile.png"),
                      fit: BoxFit.cover)),
            ),

            /// Calling _profile variable
            _profile,
            Padding(
              padding: const EdgeInsets.only(top: 360.0),
              child: Column(
                /// Setting Category List
                children: <Widget>[
                  /// Call category class
                  category(
                    txt: "notification",
                    padding: 35.0,
                    image: "assets/icon/notification.png",
                    tap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new notification()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 85.0, right: 30.0),
                    child: Divider(
                      color: Colors.black12,
                      height: 2.0,
                    ),
                  ),
                  // category(
                  //   txt: "Payments",
                  //   padding: 35.0,
                  //   image: "assets/icon/creditAcount.png",
                  //   tap: () {
                  //     Navigator.of(context).push(PageRouteBuilder(
                  //         pageBuilder: (_, __, ___) =>
                  //             new CreditCardSetting()));
                  //   },
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(
                  //       top: 20.0, left: 85.0, right: 30.0),
                  //   child: Divider(
                  //     color: Colors.black12,
                  //     height: 2.0,
                  //   ),
                  // ),
                  category(
                    txt: "Message",
                    padding: 26.0,
                    image: "assets/icon/Chat.png",
                    tap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new Chat()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 85.0, right: 30.0),
                    child: Divider(
                      color: Colors.black12,
                      height: 2.0,
                    ),
                  ),
                  category(
                    txt: "Order History",
                    padding: 23.0,
                    image: "assets/icon/truck.png",
                    tap: () {
                      // Navigator.of(context).push(PageRouteBuilder(
                      //     pageBuilder: (_, __, ___) => new Order()));
                      Fluttertoast.showToast(msg: "Not working");
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 85.0, right: 30.0),
                    child: Divider(
                      color: Colors.black12,
                      height: 2.0,
                    ),
                  ),
                  category(
                    txt: "Setting Acount",
                    padding: 30.0,
                    image: "assets/icon/setting.png",
                    tap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new SettingAcount()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 85.0, right: 30.0),
                    child: Divider(
                      color: Colors.black12,
                      height: 2.0,
                    ),
                  ),
                  category(
                    txt: "Call Center",
                    padding: 30.0,
                    image: "assets/icon/callcenter.png",
                    tap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new CallCenter()));
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, left: 85.0, right: 30.0),
                    child: Divider(
                      color: Colors.black12,
                      height: 2.0,
                    ),
                  ),
                  category(
                    padding: 38.0,
                    txt: "About Apps",
                    image: "assets/icon/aboutapp.png",
                    tap: () {
                      Navigator.of(context).push(PageRouteBuilder(
                          pageBuilder: (_, __, ___) => new AboutApps()));
                    },
                  ),
                  Divider(),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      OutlineButton(
                        highlightedBorderColor: Colors.purple,
                        highlightElevation: 1,
                        splashColor: Colors.purple[300],
                        child: Text(
                          "Logout",
                        ),
                        onPressed: () async {
                          dynamic result = authService.signOut();

                          if (result == null) {
                            setState(() {
                              Fluttertoast.showToast(
                                  msg: "Oops! Samething went wrong!");
                            });
                          } else if (result != null) {
                            setState(() {
                              Navigator.of(context).pushReplacement(
                                  PageRouteBuilder(
                                      pageBuilder: (_, __, ___) =>
                                          new ChoseLogin()));
                            });
                            Fluttertoast.showToast(msg: "Succesfull logout!");
                          }
                        },
                      ),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10.0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text buildText(username, User user) {
    setState(() {});
    if (username != null) {
      return Text(
        username,
        style: _txtName,
      );
      // } else if ( username == null) {
      //   return Text(
      //     "Guest person",
      //     style: _txtName,
      //   );
      // } else if(authService.signAnon() != null){
      //   return Text(
      //     "Hello",
      //     style: _txtName,
      //   );
    } else {
      var email = user?.emailId;
      return Text(
          (email == null)
              ? "Guest person"
              : (email != null) ? "Bug Not fixed" : "Something Wents Wrong",
          style: _txtName);
    }
  }
}

/// Component category class to set list
class category extends StatelessWidget {
  @override
  String txt, image;
  GestureTapCallback tap;
  double padding;

  category({this.txt, this.image, this.tap, this.padding});

  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 30.0),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: Image.asset(
                    image,
                    height: 25.0,
                  ),
                ),
                Text(
                  txt,
                  style: _txtCategory,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
