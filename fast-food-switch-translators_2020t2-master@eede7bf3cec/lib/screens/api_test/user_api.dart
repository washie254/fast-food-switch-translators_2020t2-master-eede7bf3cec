
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fastfoodswitch/screens/data_use/User_data.dart';
import 'package:fastfoodswitch/screens/notifier/user_notifier.dart';
import 'package:firebase_auth/firebase_auth.dart';

getUser(UserNotifier userNotifier) async{
  QuerySnapshot snapshot = await Firestore.instance.collection("eric_test").getDocuments();

  List<User> _userList = [];

  snapshot.documents.forEach((document){
    User user = User.fromMap(document.data);
    _userList.add(user);
  });

  userNotifier.userList = _userList;
}