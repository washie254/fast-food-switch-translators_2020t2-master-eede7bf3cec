import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'Notification Screen.dart';
import 'Dialogs.dart';
import 'profile.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = 'settings_screen';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Dialogs dialogs = new Dialogs();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 6,
                child: Icon(Icons.arrow_back, color: Colors.black),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 1.5,
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width / 6,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user image.png'),
                  radius: 20,
                ),
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Settings',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontFamily: 'Capriola',
                    letterSpacing: 2.0,
                  ),
                ),
              ],
            ),
            Card(
                child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfileScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.link,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Invite Friends",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications_none,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Notifications",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotificationScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.headset_mic,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Support",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.library_books,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(
                    Icons.group,
                    color: Colors.black,
                  ),
                  title: Text(
                    "About Us",
                    style: TextStyle(
                      fontFamily: 'Capriola',
                    ),
                  ),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
              ],
            )),
            SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Container(
                height: 50,
                width: MediaQuery.of(context).size.width / 1.3,
                child: MaterialButton(
                  color: Colors.blueAccent,
                  highlightColor: Colors.blue[700],
                  minWidth: double.infinity,
                  height: 50.0,
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text(
                    "SIGN OUT",
                    style: TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'Capriola',
                      letterSpacing: 5,
                    ),
                  ),
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                      side: new BorderSide(
                        style: BorderStyle.none,
                      )),
                  onPressed: () {
                    dialogs.confirm(
                        context, 'Confirm', 'Are you sure to Sign Out?');
                  },
                ),
              ),
            ])
          ],
        ),
      ),
      bottomNavigationBar: Row(children: <Widget>[
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(color: Colors.green[50]),
          child: Icon(Icons.home, color: Colors.blue[700], size: 50),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(color: Colors.green[50]),
          child: Icon(Icons.add_circle, color: Colors.blue[700], size: 50),
        ),
        Container(
          height: 60,
          width: MediaQuery.of(context).size.width / 3,
          decoration: BoxDecoration(color: Colors.green[50]),
          child: Icon(Icons.location_on, color: Colors.blue[700], size: 50),
        ),
      ]),
    );
  }
}
