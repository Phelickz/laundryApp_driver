import 'package:flutter/material.dart';
import 'package:laundry_app_drivers/screens/login.dart';
import 'package:laundry_app_drivers/screens/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
          child: Scaffold(
        backgroundColor: Colors.black,
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 58.0),
            child: Container(
              // color: Colors.red,
              height: height*0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _button(context, true, width, height, "Login", "btn1"),
                  _button(context, false, width, height, "Register", "btn2")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _button(context, bool isLogin, double width, double height, String label, String tag) {
    return Container(
      width: width * 0.45,
      child: FloatingActionButton.extended(
        heroTag: tag,
        backgroundColor: Colors.amber[800],
        onPressed: () {
          isLogin ? Navigator.push(context, CupertinoPageRoute(builder: (context) => Login())) : 
            Navigator.push(context, CupertinoPageRoute(builder: (context) => Register()));
        },
        label: Text(label, style: GoogleFonts.aBeeZee(
          color: Colors.black,
          fontWeight: FontWeight.w700
        ),),
      ),
    );
  }
}
