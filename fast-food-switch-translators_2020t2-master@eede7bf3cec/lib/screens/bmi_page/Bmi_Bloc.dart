import 'dart:math';

import 'package:flutter/material.dart';

class Bmi_Blocc {
  int _weight;
  int _age;
  int _height;
  String _sex;
  String _physical_activtiy_string;
  double _physical_activity;
  int _target_time;
  int _KG_to_lose;
  double _Calories_to_lose;
  double _Calories_to_losePerday;
  double _BMR;
  double _caloriesToMaintain_weight_perday;
  double _caloriesToEat_perday;
  int result;

  Bmi_Blocc(this._weight, this._age, this._height, this._sex,
      this._physical_activtiy_string, this._KG_to_lose,this._target_time);

  /*calulcate the recommended daily intake*/
  void calculate_daily_requirement() {
    //determine the physical activity based on string sent from frontend
    switch (_physical_activtiy_string) {
      case 'Little to no exercise':{_physical_activity = 1.2;} break;
      case 'Light exercise(1-3 days per week)':{_physical_activity = 1.375; }break;
      case 'Moderate exercise(3-5 per week)':{_physical_activity = 1.55;}break;
      case 'Heavy exercise(6-7 per week)':{_physical_activity = 1.725;}break;
      case 'Very heavy exercise(twice per day,extra heavy workout)':{_physical_activity = 1.9;}break;
      default: {print("physical acitvity cannot be determined");return;}break;
    }
    //different equation based on sex
    if (_sex == "male") {
      _BMR = (10*_weight)+(6.25*_height)-(5*_age)+5;
    } else if (_sex == "female") {
      _BMR =(10*_weight)+(6.25*_height)-(5*_age)-161;
    } else {
      print("something went wrong the person is neither male or female");
      return;
    }
    _caloriesToMaintain_weight_perday = _BMR * _physical_activity;
    //convert kg to calories
    _Calories_to_lose = _KG_to_lose * 7716.17918;
    //convert month to day
    _target_time = _target_time*30;
    _Calories_to_losePerday = _Calories_to_lose/_target_time;
    _caloriesToEat_perday = _caloriesToMaintain_weight_perday - _Calories_to_losePerday;
    //round up to 0 decimal place
    result = _caloriesToEat_perday.round();
    //determine if calories to lose per day is at dangerous level
    if(_caloriesToEat_perday < 1200){
      print("dangerous level of calorie deficit");
    }
    else {
      print("all good");
    }
    print(_height);

  }

  void SaveUserData() {
    // send the data to firebase
  }
//
//  bool CheckUserInput(){
//    //check if height is correct
//    if(_height == null || _height < 0 )
//  }
}
