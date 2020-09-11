import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:profile_page/values/values.dart';

//Read CSV
// import 'dart:io';
// import 'dart:async';
// import 'dart:convert';
class ExternalDatabase extends StatefulWidget {
  static const String id = 'external_database';
  @override
  _ExternalDatabaseState createState() => _ExternalDatabaseState();
}

class _ExternalDatabaseState extends State<ExternalDatabase> {
  final databaseReference = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Database Intergration Demo'),
      ),

      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          RaisedButton(
            child: Text('Add Food Item'),
            onPressed: () {
              createRecord();
              //readCSV();
            },
          ),
          RaisedButton(
            child: Text('View Food Items'),
            onPressed: () {
              getData();
            },
          ),
          RaisedButton(
            child: Text('Update'),
            onPressed: () {
              updateData();
            },
          ),
          RaisedButton(
            child: Text('Delete Food Item'),
            onPressed: () {
              deleteData();
            },
          ),
        ],
      )), //center
    );
  }

  void createRecord() async {
    await databaseReference
        .collection("Res_Grilled")
        .document("Traditional Bun")
        .setData({
      'Date of Capture': '2/13/2020',
      'Serving Size (g)': '283',
      'Energy (kJ)': '2680',
      'Protein (g)': '32.6',
      'Fat, total (g)': '31.3',
      'Saturated (g)': '9',
      'Carbohydrate (g)': '52.8',
      'Sugars (g)': '11',
      'Sodium (mg)': '1140',
    });
  }

  void getData() {
    databaseReference
        .collection("Res_Grilled")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) => print('${f.data}}'));
    });
  }

  void updateData() {
    try {
      databaseReference
          .collection('Res_Grilled')
          .document('Traditional Bun')
          .updateData({'Carbohydrate (g)': '100'});
    } catch (e) {
      print(e.toString());
    }
  }

  void deleteData() {
    try {
      databaseReference
          .collection('Res_Grilled')
          .document('Traditional Bun')
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}
