import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app_drivers/state/authState.dart';
import 'package:provider/provider.dart';

import 'category.dart';
import 'home.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Provider.of<AuthenticationState>(context, listen: false)
          .currentUser()
          .then((currentUser) => {
                if (currentUser == null)
                  {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Category()))
                  }
                else
                  {
                    Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()))
                        .catchError((e) => print(e))
                  }
              })
          .catchError((e) => print(e));
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          Positioned(
            top: height * 0.46,
            left: width * 0.28,
            child: Text(
              'SIVRAM WASH',
              style: GoogleFonts.dosis(
                  color: Colors.amber[700],
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            top: height * 0.51,
            left: width * 0.23,
            child: Text(
              'Laundry services at your doorstep',
              style: GoogleFonts.dosis(
                  color: Colors.amber[200],
                  fontSize: 17,
                  fontWeight: FontWeight.w200),
            ),
          ),
          Positioned(
            top: height * 0.8,
            left: width * 0.45,
            child: SpinKitThreeBounce(
              size: 20,
              color: Colors.amber[800],
            )
          ),
          Positioned(
            top: height * 0.9,
            left: width * 0.45,
            child: Text(
              'Driver',
              style: GoogleFonts.dosis(
                  color: Colors.amber[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
