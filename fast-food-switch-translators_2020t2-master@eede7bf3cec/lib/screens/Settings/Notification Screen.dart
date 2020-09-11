import 'package:flutter/material.dart';
import 'Settings.dart';

class NotificationScreen extends StatefulWidget {
  static const String id = 'notification_screen';
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}


class _NotificationScreenState extends State<NotificationScreen> {
  bool _enabled = false;
  bool _enabled1 = false;
  bool _enabled2 = false;
  bool _enabled3 = false;
  @override
  Widget build(BuildContext context) {
    var _onPressed;
    if (_enabled){
      _onPressed = (){
        print("tap");
      };
    }

    if (_enabled1){
      _onPressed = (){
        print("tap1");
      };
    }

    if (_enabled2){
      _onPressed = (){
        print("tap1");
      };
    }

    if (_enabled3){
      _onPressed = (){
        print("tap1");
      };
    }
    return Scaffold(
      appBar: AppBar(
        leading:IconButton(icon: Icon(Icons.arrow_back, color: Colors.black), onPressed:(){
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=>SettingsScreen()),);
        }),
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text('Notification Settings',style: TextStyle(color: Colors.black, fontFamily: 'Capriola'),),
      ),
      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              activeColor: Colors.blueAccent,
              contentPadding: const EdgeInsets.all(8),
              value: _enabled,
              title: Text("Received app notification", style: TextStyle(fontFamily: 'Capriola'),),
              onChanged: (bool value){
                setState((){
                  _enabled = value;
                });

              },
            ),



            SwitchListTile(
              activeColor: Colors.blueAccent,
              contentPadding: const EdgeInsets.all(8),
              value: _enabled1,
              title: Text("Open loacation require", style: TextStyle(fontFamily: 'Capriola'),),
              onChanged: (bool value){
                setState((){
                  _enabled1 = value;
                });
              },
            ),



            SwitchListTile(
              activeColor: Colors.blueAccent,
              contentPadding: const EdgeInsets.all(8),
              value: _enabled2,
              title: Text("App Updates automatically", style: TextStyle(fontFamily: 'Capriola'),),
              onChanged: (bool value){
                setState((){
                  _enabled2 = value;
                });
              },
            ),



            SwitchListTile(
              activeColor: Colors.blueAccent,
              contentPadding: const EdgeInsets.all(8),
              value: _enabled3,
              title: Text("Received notification", style: TextStyle(fontFamily: 'Capriola'),),
              onChanged: (bool value){
                setState((){
                  _enabled3 = value;
                });
              },
            ),


          ],
        ),
      ),

    );
  }
}