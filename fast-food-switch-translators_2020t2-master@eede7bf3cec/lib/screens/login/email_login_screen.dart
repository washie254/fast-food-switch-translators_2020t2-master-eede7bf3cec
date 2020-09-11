import 'package:fastfoodswitch/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodswitch/widgets/Rounded_button/RoundedButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EmailLoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _EmailLoginScreenState createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  String _emailLabelText;
  String _passwordLabelText;
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width,
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                ModalProgressHUD(
                  inAsyncCall: showSpinner,
                  child: Form(
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
                                  'Enter your details',
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
                            height: 24.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundedButton(
                                  title: 'Log in',
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
                                      try {
                                        await _auth
                                            .signInWithEmailAndPassword(
                                                email: email,
                                                password: password)
                                            .then((user) {
                                          setState(() {
                                            showSpinner = false;
                                          });
                                          Navigator.pushNamed(
                                              context, HomeScreen.id);
                                        });
                                      } catch (e) {
                                        setState(() {
                                          showSpinner = false;
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Error'),
                                                  content: Text(
                                                      'Incorrect email/password combination'),
                                                  actions: [
                                                    FlatButton(
                                                      child: Text("Try Again"),
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            EmailLoginScreen
                                                                .id);
                                                      },
                                                    ),
                                                  ],
                                                );
                                              });
                                        });
                                      }
                                    }
                                  }),
                            ],
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'Forgot password?',
                                style: TextStyle(
                                    fontFamily: 'Capriola',
                                    fontSize: 18,
                                    color: Colors.blue),
                              ),
                            ],
                          )
                        ],
                      ),
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

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Retry entering email';
    else
      return null;
  }
}
