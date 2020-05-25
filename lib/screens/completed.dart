import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/home.dart';
import '../screens/profile.dart';
import 'package:flutter/cupertino.dart';

class Completed extends StatefulWidget {
  @override
  _CompletedState createState() => _CompletedState();
}

class _CompletedState extends State<Completed> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        bottomNavigationBar: BottomAppBar(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.amber[800],
                ),
                onPressed: () {
                  Navigator.push(
                      context, CupertinoPageRoute(builder: (context) => Home()));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.verified_user,
                  color: Colors.green[800],
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle,
                  color: Colors.amber[800],
                ),
                onPressed: () {
                  Navigator.push(
                      context, CupertinoPageRoute(builder: (context) => Profile()));
                },
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            _text(width, height),
          ],
        ),
      ),
    );
  }

  Widget _text(double width, double height) {
    return Positioned(
      top: height * 0.02,
      left: width * 0.02,
      child: Text(
        'Completed',
        style: GoogleFonts.aBeeZee(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.amber[800]),
      ),
    );
  }
}
