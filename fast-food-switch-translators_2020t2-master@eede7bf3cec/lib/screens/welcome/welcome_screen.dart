import 'dart:ui';
import 'package:fastfoodswitch/screens/login/login_screen.dart';
import 'package:fastfoodswitch/screens/registration/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodswitch/widgets/Rounded_button/RoundedButton.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/home_screen_animation.gif"),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 58.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(
                      'assets/images/logo.png',
                      height: 150,
                      width: 150,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Flexible(
                  child: Text(
                    'Make smarter fast food choices',
                    style: TextStyle(
                        fontSize: 42,
                        fontFamily: 'Capriola',
                        color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Opacity(
                  opacity: 0.8,
                  child: RoundedButton(
                    title: 'Sign up',
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Capriola',
                      color: Colors.white,
                    ),
                    colour: Colors.lightGreen,
                    width: 318,
                    onPressed: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                  ),
                ),
                Opacity(
                  opacity: 0.8,
                  child: RoundedButton(
                    title: 'Log in',
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Capriola',
                      color: Colors.white,
                    ),
                    width: 318,
                    colour: Colors.blueAccent,
                    onPressed: () {
                      Navigator.pushNamed(context, LogInScreen.id);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
