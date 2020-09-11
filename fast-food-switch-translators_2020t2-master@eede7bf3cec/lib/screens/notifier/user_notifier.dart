import 'dart:collection';

import 'package:fastfoodswitch/screens/data_use/User_data.dart';
import 'package:flutter/cupertino.dart';

class UserNotifier with ChangeNotifier{
  List<User> _userList = [];
  User _currentUser;

  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);

  User get currentUser => _currentUser;

  set userList(List<User> userList){
    _userList = userList;
    notifyListeners();
  }

  set currentUser(User user){
    _currentUser = user;
    notifyListeners();
  }
}