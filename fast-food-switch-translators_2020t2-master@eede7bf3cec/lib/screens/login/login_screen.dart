import 'package:fastfoodswitch/screens/home/home.dart';
import 'package:fastfoodswitch/screens/login/facebook_login_screen.dart';
import 'package:fastfoodswitch/widgets/Rounded_button/RoundedButtonWithImage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodswitch/screens/login/email_login_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

class LogInScreen extends StatefulWidget {
  static const String id = 'log_in_screen';
  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  String clientid = "817334828805183";
  String redirecturl =
      "https://fast-food-switch-project.firebaseapp.com/__/auth/handler";
  FirebaseAuth firebaseAuth;
  Map userProfile;
  final facebookLogin = FacebookLogin();


  _signInFacebook() async {
    bool _isLoggedIn;
    final result = await facebookLogin.logIn(['email']);

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        final token = result.accessToken.token;
        final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=$token');
        final profile = JSON.jsonDecode(graphResponse.body);
        print(profile);
        setState(() {
          userProfile = profile;
          _isLoggedIn = true;
            Navigator.pushNamed(context, HomeScreen.id);
        });
        break;

      case FacebookLoginStatus.cancelledByUser:
        setState(() => _isLoggedIn = false );
        break;
      case FacebookLoginStatus.error:
        setState(() => _isLoggedIn = false );
        break;
    }
  }

  loginWithFacebook() async {
    String result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FacebookWebView(
                selectedUrl:
                    'https://www.facebook.com/dialog/oauth?client_id=$clientid&redirect_uri=$redirecturl&response_type=token&scope=email,public_profile,',
              ),
          maintainState: true),
    );
    if (result != null) {
      try {
        final facebookAuthCred =
            FacebookAuthProvider.getCredential(accessToken: result);
        final user = await firebaseAuth.signInWithCredential(facebookAuthCred);
        return user;
      } catch (e) {
        print(e);
      }
    }
  }
  _logout(){
    facebookLogin.logOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

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
                    'Welcome back!',
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Capriola',
                        color: Colors.black),
                  ),
                ),
                SizedBox(height: 60),
                RoundedButtonWithImage(
                  title: 'Log in with Email',
                  imageLocation: 'assets/images/email_icon.png',
                  textStyle: TextStyle(
                    fontSize: 20,
                    fontFamily: 'Capriola',
                    color: Colors.white,
                  ),
                  colour: Colors.black,
                  width: 366,
                  onPressed: () {
                    Navigator.pushNamed(context, EmailLoginScreen.id);
                  },
                ),
                SizedBox(height: 47),
                RoundedButtonWithImage(
                  title: 'Continue with Facebook',
                  imageLocation: 'assets/images/facebook_icon.png',
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Capriola',
                    color: Colors.white,
                  ),
                  width: 366,
                  colour: Colors.black,
                  onPressed: () {
                    loginWithFacebook();
                  },
                ),
                SizedBox(
                  height: 47,
                ),
                RoundedButtonWithImage(
                  title: 'Continue with Google',
                  imageLocation: 'assets/images/google_icon.png',
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Capriola',
                    color: Colors.white,
                  ),
                  width: 366,
                  colour: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
