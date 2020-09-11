import 'dart:ui';
import 'package:fastfoodswitch/screens/home/home.dart';
import 'package:fastfoodswitch/widgets/Rounded_button/RoundedButtonWithImage.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodswitch/screens/registration/email_signup_screen.dart';
import 'package:fastfoodswitch/screens/login/email_login_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'sign_up_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 58.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: Text(
                    'Welcome to Health Switch',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Capriola',
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 60),
                RoundedButtonWithImage(
                  title: 'Sign up with Email',
                  imageLocation: 'assets/images/email_icon.png',
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Capriola',
                    color: Colors.white,
                  ),
                  colour: Colors.black,
                  width: 366,
                  onPressed: () {
                    Navigator.pushNamed(context, EmailSignUpScreen.id);
                  },
                ),
                SizedBox(height: 47),
                RoundedButtonWithImage(
                  title: 'Sign up with Facebook',
                  imageLocation: 'assets/images/facebook_icon.png',
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Capriola',
                    color: Colors.white,
                  ),
                  width: 366,
                  colour: Colors.black,
                  onPressed: () {},
                ),
                SizedBox(
                  height: 47,
                ),
                RoundedButtonWithImage(
                  title: 'Sign up with Google',
                  imageLocation: 'assets/images/google_icon.png',
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Capriola',
                    color: Colors.white,
                  ),
                  width: 366,
                  colour: Colors.black,
                  onPressed: () {
                    _googleSignUp();
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Flexible(
                  child: RichText(
                    text: TextSpan(
                      text:
                          'By continuing, you are agreeing to Health Switch’s ',
                      style: TextStyle(
                          fontSize: 13,
                          fontFamily: 'Capriola',
                          color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms and Conditions',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Capriola',
                              color: Colors.blue),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Capriola',
                              color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Capriola',
                              color: Colors.blue),
                        ),
                      ],
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

  Future<void> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final FirebaseUser user =
          (await _auth.signInWithCredential(credential)).user;
      print("signed in " + user.displayName);

      Navigator.pushNamed(context, HomeScreen.id);
      return user;
    } catch (e) {
      print(e.message);
    }
  }
}
