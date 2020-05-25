import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app_drivers/state/authState.dart';
import 'package:provider/provider.dart';

import 'login.dart';
import 'register.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
String _photo;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void initState() {
    getData();
    docSnapshot();
    super.initState();
  }


  Future<void> getData() async {
    await FirebaseAuth.instance.currentUser().then((user) {
      setState(() {
       _usernameController.text = user.displayName;
        _emailController.text = user.email;
        this._photo = user.photoUrl;
        // _phoneController.text = user.phoneNumber;
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> docSnapshot() async {
    final uid = await Provider.of<AuthenticationState>(context, listen: false).currentUserId();
    var something =
        await Firestore.instance.collection('drivers').document(uid).get();
    DocumentSnapshot doc = something;
    setState(() {
      _phoneController.text = doc['phone'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _background(context),
            _backButton(context),
            _submitButton(context),
            _profilePhoto(context),
            _text(context),
            _editForm()
          ],
        ),
      ),
    );
  }

  Widget _background(BuildContext _context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black);
  }

  Widget _backButton(BuildContext _context) {
    return Positioned(
      top: 20,
      left: 10,
      child: Card(
        elevation: 20,
        shape: CircleBorder(),
        child: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 20,
            child: Icon(Icons.cancel, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget _submitButton(BuildContext _context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.88,
      left: MediaQuery.of(context).size.width * 0.85,
      child: Card(
          elevation: 20,
          shape: CircleBorder(),
          child: InkWell(
            onTap: () {
              // _formKey.currentState;
            },
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              child: Icon(Icons.done, color: Colors.black),
            ),
          )),
    );
  }

  Widget _profilePhoto(BuildContext _context) {
    return Positioned(
      top: 70,
      left: MediaQuery.of(context).size.width * 0.4,
      child: CircleAvatar(
        backgroundImage: this._photo != null ? NetworkImage(this._photo) : null,
        radius: 40,
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _text(BuildContext _context) {
    return Positioned(
      top: 155,
      left: MediaQuery.of(context).size.width * 0.3,
      child: InkWell(
        onTap: () {
          // Navigator.push(context,
          //     CupertinoPageRoute(builder: (context) => ImageCapture()));
        },
        child: Text(
          'Change Profile Picture',
          style: TextStyle(
              // color: Colors.black,
              fontSize: 15,
              fontFamily: 'WorkSansSemiBold'),
        ),
      ),
    );
  }

  Widget _editForm() {
    return Positioned(
        top: 210,
        child: Builder(builder: (BuildContext _context) {
          return Container(
            // color: Colors.blue,
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 30),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Username',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _usernameController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            fillColor: Colors.white,
                            hoverColor: Colors.blue,
                            focusColor: Colors.blue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Email Address',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        validator: EmailValidator.validate,
                        controller: _emailController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hoverColor: Colors.blue,
                            focusColor: Colors.blue),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Phone',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: _phoneController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            hoverColor: Colors.blue,
                            focusColor: Colors.blue),
                      ),
                    ],
                  )),
            ),
          );
        }));
  }
}
