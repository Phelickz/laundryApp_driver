import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/completed.dart';
import 'package:flutter/cupertino.dart';
import '../screens/profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
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
                    color: Colors.green[800],
                  ),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(
                    Icons.verified_user,
                    color: Colors.amber[800],
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Completed()));
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.account_circle,
                    color: Colors.amber[800],
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (context) => Profile()));
                  },
                ),
              ],
            ),
          ),
          body: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              _text(width, height),
              _orders(width, height)
            ],
          ),
        ),
      ),
    );
  }

  Widget _orders(double width, double height) {
    return Builder(
      builder: (BuildContext _context) {
        return Positioned(
          top: height * 0.1,
          child: Container(
            
            margin: EdgeInsets.only(left: 15),
            padding: EdgeInsets.only(
              bottom: 100,
            ),
            decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(15)),
            width: width * 0.9,
            height: height * 0.94 ,
            child: Card(
              color: Colors.amber[600],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 28,
                          child: Icon(
                            Icons.shopping_cart,
                            size: 30,
                            color: Colors.yellowAccent[700],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 18.0),
                          child: Text(
                            "#12344221",
                            style: GoogleFonts.aBeeZee(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Order requested by Felix',
                      style: GoogleFonts.aBeeZee(
                          fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 28,
                          child: Icon(
                            Icons.location_on,
                            size: 30,
                            color: Colors.yellowAccent[700],
                          ),
                          backgroundColor: Colors.black,
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Pick Up Location: ',
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            Text(
                              'Surulere, Lagos',
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            )
                          ],
                        ),
                        
                      ],
                    ),
                    SizedBox(height: 15,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 28,
                          child: Icon(
                            Icons.location_on,
                            size: 30,
                            color: Colors.yellowAccent[700],
                          ),
                          backgroundColor: Colors.black,
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Pick Up Time: ',
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            Text(
                              'Morning',
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            )
                          ],
                        ),
                        
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(thickness: 2),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 28,
                          child: Icon(
                            Icons.account_circle,
                            size: 30,
                            color: Colors.yellowAccent[700],
                          ),
                          backgroundColor: Colors.black,
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Client's info: ",
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            Text(
                              'Felix',
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w700, fontSize: 20),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: width * 0.7,
                        child: FloatingActionButton.extended(
                            heroTag: 'btn55',
                            backgroundColor: Colors.black,
                            icon: Icon(Icons.phone),
                            onPressed: () {},
                            label: Text("Call Felix")),
                      ),
                    ),
                    SizedBox(height: 15),
                    Divider(thickness: 2),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: width * 0.7,
                        child: FloatingActionButton.extended(
                            heroTag: 'btn22',
                            backgroundColor: Colors.black,
                            icon: Icon(Icons.motorcycle),
                            onPressed: () {},
                            label: Text('Take Order')),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _text(double width, double height) {
    return Positioned(
      top: height * 0.02,
      left: width * 0.02,
      child: Text(
        'Sivram Wash',
        style: GoogleFonts.aBeeZee(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.amber[800]),
      ),
    );
  }
}
