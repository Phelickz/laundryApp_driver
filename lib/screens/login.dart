import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:laundry_app_drivers/services/snackbarService.dart';
import 'package:laundry_app_drivers/state/authState.dart';
import 'package:laundry_app_drivers/utils/utilities.dart';
import 'package:provider/provider.dart';
import '../screens/register.dart';
import '../screens/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  final FocusNode myFocusNodePassword = FocusNode();
  final FocusNode myFocusNodeEmail = FocusNode();
  final FocusNode myFocusNodeUsername = FocusNode();
  final FocusNode myFocusNodePhone = FocusNode();

  final _formKey = GlobalKey<FormState>();

  bool _obscureTextSignup = true;
  // bool _obscureTextSignupConfirm = true;

  @override
  void dispose() {
    myFocusNodePassword.dispose();
    myFocusNodeEmail.dispose();

    super.dispose();
  }

  void _toggleSignup() {
    setState(() {
      _obscureTextSignup = !_obscureTextSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          _text(width, height),
          _form(width, height),
          _button(width, height),
          _text1(width, height),
        ],
      ),
    );
  }

   Widget _text1(double width, double height) {
    return Positioned(
      top: height * 0.86,
      left: width * 0.32,
      child: GestureDetector(
        onTap: (){
          Navigator.push(context, CupertinoPageRoute(builder : (context) => Register()));
        },
              child: Text(
          'No account? Register',
          style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.white60),
        ),
      ),
    );
  }


  Widget _button(double width, double height) {
    return Builder(
      builder: (BuildContext _context) {
      SnackBarService.instance.buildContext = _context;

        return Positioned(
          top: height * 0.75,
          left: width * 0.31,
          child: Container(
            width: width * 0.4,
            child: FloatingActionButton.extended(
              backgroundColor: Colors.amber[800],
              onPressed: () {
                final form = _formKey.currentState;
                form.save();
                if (form.validate()) {
                  try {
                    Provider.of<AuthenticationState>(context, listen: false)
                        .login(_emailController.text, _passwordController.text)
                        .then((signInUser) => gotoHomeScreen(context));
                  } catch (e) {
                    print(e);
                  }
                }
              },
              label: Text(
                'Sign In',
                style: GoogleFonts.aBeeZee(color: Colors.black, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _text(double width, double height) {
    return Positioned(
      top: height * 0.25,
      left: width * 0.09,
      child: Text(
        'Sign In',
        style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: 35,
            color: Colors.amber[800]),
      ),
    );
  }

  Widget _form(double width, double height) {
    return Positioned(
      top: height * 0.4,
      child: Container(
        // color: Colors.white,
        height: height * 0.2,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      style: TextStyle(color: Colors.black),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      focusNode: myFocusNodeEmail,
                      validator: EmailValidator.validate,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black38),
                          // ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.green)),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.amber[800],
                          ),
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.black38),
                          focusColor: Colors.amber[800],
                          hoverColor: Colors.amber[800]),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: TextFormField(
                      controller: _passwordController,
                      style: TextStyle(color: Colors.black),
                      focusNode: myFocusNodePassword,
                      validator: PasswordValidator.validate,
                      obscureText: _obscureTextSignup,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          // enabledBorder: UnderlineInputBorder(
                          //   borderSide: BorderSide(color: Colors.black38),
                          // ),
                          suffixIcon: GestureDetector(
                            onTap: _toggleSignup,
                            child: Icon(
                              _obscureTextSignup
                                  ? Icons.remove_red_eye
                                  : Icons.enhanced_encryption,
                              // size: 15.0,
                              color: Colors.amber[800],
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Colors.green)),
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.black38),
                          focusColor: Colors.amber[800],
                          hoverColor: Colors.amber[800]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class EmailValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Email cannot be empty";
    }
    return null;
  }
}

class UsernameValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Username cannot be empty";
    }
    if (value.length < 2) {
      return "Username is too short";
    }
    return null;
  }
}

class PasswordValidator {
  static String validate(String value) {
    if (value.isEmpty) {
      return "Password cannot be empty";
    }
    return null;
  }
}

class PhoneValidator {
  static String validate(String value) {
    if (value.length < 10) {
      return "Please enter a valid number";
    }
    return null;
  }
}
