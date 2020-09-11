import 'package:flutter/material.dart';
import '../screens/bmi_page/BMIform.dart';

class BMIform_data {
  TextEditingController user_Height = TextEditingController();
  TextEditingController user_Weight = TextEditingController();
  TextEditingController user_Age = TextEditingController();
  TextEditingController Kg_to_lose = TextEditingController();
  int user_Height_int;
  int user_Weight_int;
  int user_Age_int;
  int KgToLose_int;
  String target_Time;
  String physicalActivity;
  bool Selected = false;
  Color Card1_Color = Colors.white;
  Color Card2_Color = Colors.white;
  List<String> physicalActivity_List = [
    'Little to no exercise',
    'Light exercise(1-3 days per week)',
    'Moderate exercise(3-5 per week)',
    'Heavy exercise(6-7 per week)',
    'Very heavy exercise(twice per day,extra heavy workout)'
  ];
  List<String> monthlist = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12'
  ];
  String gender;
}
