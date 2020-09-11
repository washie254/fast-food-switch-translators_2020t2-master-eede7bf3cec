
import 'package:fastfoodswitch/screens/Settings/Settings.dart';
import 'package:fastfoodswitch/screens/Settings/profile.dart';
import 'package:fastfoodswitch/screens/bmi_page/BMIform.dart';
import 'package:fastfoodswitch/screens/map/map.dart';
import 'package:fastfoodswitch/screens/notifier/user_notifier.dart';
import 'package:fastfoodswitch/screens/nutritional_value/nutrition_screen.dart';
import 'package:fastfoodswitch/screens/recommendation/HomePage.dart';
import 'package:fastfoodswitch/screens/welcome/welcome_screen.dart';
import 'package:fastfoodswitch/screens/registration/email_signup_screen.dart';
import 'package:fastfoodswitch/screens/registration/signup_screen.dart';
import 'package:fastfoodswitch/screens/login/login_screen.dart';
import 'package:fastfoodswitch/screens/login/email_login_screen.dart';
import 'package:fastfoodswitch/screens/home/home.dart';
import 'package:fastfoodswitch/services/external_database.dart';
import 'package:flutter/material.dart';
import 'package:fastfoodswitch/screens/onboarding/onboarding_screen.dart';
import 'package:provider/provider.dart';

import 'screens/onboarding/onboarding_screen.dart';

void main() => runApp(
  MultiProvider(providers: [
  ChangeNotifierProvider(builder: (context)=>UserNotifier(),
    )
  ],
  child: FastFoodSwitch(),
));

class FastFoodSwitch extends StatefulWidget {
  @override
  _FastFoodSwitchState createState() => _FastFoodSwitchState();
}

class _FastFoodSwitchState extends State<FastFoodSwitch> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'IntroViews Flutter', //title of app
        // change the initialRoute here if you want to test out your screen
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Capriola',
        ),
        home: LogInScreen(),
        // change the initialRoute here if you want to test out your screen

        initialRoute: LogInScreen.id,
        routes: {
          // Define the routes here
          WelcomeScreen.id: (context) => WelcomeScreen(),
          SignUpScreen.id: (context) => SignUpScreen(),
          EmailLoginScreen.id: (context) => EmailLoginScreen(),
          EmailSignUpScreen.id: (context) => EmailSignUpScreen(),
          HomeScreen.id: (context) => HomeScreen(),
          RecommendationScreen.id: (context) => RecommendationScreen(),
          LogInScreen.id: (context) => LogInScreen(),
          OnboardingScreen.id: (context) => OnboardingScreen(),
          BMIformScreen.id: (context) => BMIformScreen(),
          ExternalDatabase.id: (context) => ExternalDatabase(),
          MapScreen.id: (context) => MapScreen(),
          NutritionScreen.id: (context) => NutritionScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          SettingsScreen.id: (context) => SettingsScreen(),
          //Builder
        }); //Material App
  }
}
