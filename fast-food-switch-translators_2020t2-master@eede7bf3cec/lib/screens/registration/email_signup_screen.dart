import 'package:fastfoodswitch/screens/home/home.dart';
import 'package:fastfoodswitch/screens/login/email_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodswitch/widgets/Rounded_button/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:ui';

class EmailSignUpScreen extends StatefulWidget {
  static const String id = 'email_signup_screen';
  @override
  _EmailSignUpScreenState createState() => _EmailSignUpScreenState();
}

class _EmailSignUpScreenState extends State<EmailSignUpScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  String _emailLabelText;
  String _passwordLabelText;
  String _confirmPasswordLabelText;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Form(
                    key: _form,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  'Create your new account',
                                  style: TextStyle(
                                    fontFamily: 'Capriola',
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 48.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 50, left: 50),
                            child: TextFormField(
                              autofocus: false,
                              controller: _email,
                              validator: validateEmail,
                              textAlign: TextAlign.start,
                              onChanged: (value) {
                                setState(() {
                                  if (value.isNotEmpty) {
                                    _emailLabelText = 'E-mail';
                                  } else {
                                    _emailLabelText = null;
                                  }
                                });
                                email = value;
                              },
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15),
                                labelText: _emailLabelText,
                                hintText: 'E-mail',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Capriola',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Capriola',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 50, left: 50),
                            child: TextFormField(
                              obscureText: true,
                              autofocus: false,
                              controller: _pass,
                              validator: (val) {
                                if (val.isEmpty)
                                  return 'Empty';
                                else
                                  return null;
                              },
                              textAlign: TextAlign.start,
                              onChanged: (value) {
                                setState(() {
                                  if (value.isNotEmpty) {
                                    _passwordLabelText = 'Password';
                                  } else {
                                    _passwordLabelText = null;
                                  }
                                });
                                password = value;
                              },
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15),
                                labelText: _passwordLabelText,
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Capriola',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Capriola',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 50, left: 50),
                            child: TextFormField(
                              controller: _confirmPass,
                              validator: (val) {
                                if (val.isEmpty) return 'Empty';
                                if (val != _pass.text)
                                  return 'Passwords not matching';
                                return null;
                              },
                              obscureText: true,
                              autofocus: false,
                              textAlign: TextAlign.start,
                              onChanged: (value) {
                                setState(() {
                                  if (value.isNotEmpty) {
                                    _confirmPasswordLabelText =
                                        'Re-enter Password';
                                  } else {
                                    _confirmPasswordLabelText = null;
                                  }
                                });
                                password = value;
                              },
                              textInputAction: TextInputAction.done,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 15),
                                labelText: _confirmPasswordLabelText,
                                hintText: 'Re-enter Password',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Capriola',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                labelStyle: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Capriola',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.transparent, width: 1)),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 24.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedButton(
                                title: 'Sign Up',
                                width: 290,
                                textStyle: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Capriola',
                                    color: Colors.white),
                                colour: Colors.lightBlue,
                                onPressed: () async {
                                  if (_form.currentState.validate()) {
                                    setState(() {
                                      showSpinner = true;
                                    });
                                    await _auth
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password)
                                        .then((user) {
                                      setState(() {
                                        showSpinner = false;
                                      });
                                      Navigator.pushNamed(
                                          context, HomeScreen.id);
                                    }).catchError((e) {
                                      setState(() {
                                        showSpinner = false;
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('Error'),
                                                content: Text(
                                                    'There is already an e-mail existing with these details, would you like to login now?'),
                                                actions: [
                                                  FlatButton(
                                                    child: Text("Login"),
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          EmailLoginScreen.id);
                                                    },
                                                  ),
                                                  FlatButton(
                                                    child: Text("Cancel"),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            });
                                      });
                                    });
                                  }
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }
}
