import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String name;
  int age;
  int daily_kj_intake;
  int daily_kj_retuqire;

  User.fromMap(Map<String, dynamic> data){
    name = data["Name"];
    age = data["Age"];
    daily_kj_intake = data["Daily Kilojoule Intake"];
    daily_kj_retuqire = data["Daily Kilojoule Requirement"];
  }
}