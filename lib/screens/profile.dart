import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app_drivers/services/firestore.dart';
import 'package:laundry_app_drivers/state/authState.dart';
import 'package:laundry_app_drivers/state/userState.dart';
import 'package:laundry_app_drivers/utils/utilities.dart';
import 'package:provider/provider.dart';
import '../screens/home.dart';
import '../screens/completed.dart';
import 'package:flutter/cupertino.dart';

import 'editprofile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _uid;
  @override
  void initState() {
    getUid();
    UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    getUsersData(userNotifier, _uid);
    super.initState();
  }

  Future<void> getUid() async {
    var uid = await Provider.of<AuthenticationState>(context, listen: false)
        .currentUserId();
    setState(() {
      this._uid = uid;
    });
  }

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
                  Navigator.push(context,
                      CupertinoPageRoute(builder: (context) => Home()));
                },
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
                  color: Colors.green[800],
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        body: Stack(
          children: <Widget>[
            _text(width, height),
            _userData(),
            _button(width, height)
          ],
        ),
      ),
    );
  }

  Widget _userData() {
    return Builder(
      builder: (BuildContext _context) {
        UserNotifier userNotifier = Provider.of<UserNotifier>(context);

        double width = MediaQuery.of(_context).size.width;
        double height = MediaQuery.of(_context).size.height;
        return Positioned(
            top: height * 0.3,
            left: width * 0.2,
            child: Container(
              // color: Colors.bla,
              width: width * 0.62,
              height: height * 0.4,
              child: ListView.builder(
                  itemCount: userNotifier.userProfileData.length,
                  itemBuilder: (_context, index) {
                    var _data = userNotifier.userProfileData[index];
                    return Container(
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(_data.photoUrl),
                              radius: 50,
                              backgroundColor: Colors.green[800],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                _data.username,
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              _data.email,
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white54),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              _data.phone,
                              style: GoogleFonts.aBeeZee(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white54),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ));
      },
    );
  }

  Widget _text(double width, double height) {
    return Positioned(
      top: height * 0.02,
      left: width * 0.02,
      child: Text(
        'Profile',
        style: GoogleFonts.aBeeZee(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.amber[800]),
      ),
    );
  }

  Widget _button(double width, double height) {
    return Positioned(
      left: width * 0.9,
      top: height * 0.01,
      child: IconButton(
        onPressed: _modalBottomSheetMenu,
        color: Colors.green[800],
        icon: Icon(Icons.more_vert),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        backgroundColor: Colors.grey[800],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        context: context,
        builder: (builder) {
          return new Container(
            padding: EdgeInsets.only(top: 10),
            height: MediaQuery.of(context).size.height * 0.2,
            // color: Colors.grey[800],
            // color: Color(0xFF737373), //could change this to Color(0xFF737373),
            //so you don't have to change MaterialApp canvasColor
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                  leading: new Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  title: new Text(
                    'Edit Profile',
                    style: TextStyle(
                      color: Colors.white,

                      // color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                ),
                new ListTile(
                  leading: new Icon(
                    Icons.exit_to_app,
                    color: Colors.white,

                    // color: Colors.black,
                  ),
                  title: new Text(
                    'Sign Out',
                    style: TextStyle(
                      color: Colors.white,

                      // color: Colors.black,
                    ),
                  ),
                  onTap: () async {
                    final _auth = Provider.of<AuthenticationState>(context,
                        listen: false);
                    await _auth.logout();
                    gotoLoginScreen(context);
                  },
                ),
              ],
            ),
          );
        });
  }
}
