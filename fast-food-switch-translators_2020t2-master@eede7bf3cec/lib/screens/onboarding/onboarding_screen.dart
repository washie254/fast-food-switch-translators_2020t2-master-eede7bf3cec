import 'package:fastfoodswitch/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = 'landing_screen';
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  final pages = [
    PageViewModel(
        pageColor: const Color(0xFF8ec3f8),
        body: Text(
          'Have you encounter Weight concerns when it comes to food ?',
        ),
        title: Text(
          'Knowing \n    your \n   intake',
        ),
        titleTextStyle: TextStyle(fontFamily: 'Capriola', color: Colors.white),
        bodyTextStyle: TextStyle(fontFamily: 'Capriola', color: Colors.white),
        mainImage: Image.asset(
          'assets/images/Eating Concerns.png',
          height: 285.0,
          width: 285.0,
          alignment: Alignment.center,
        )),

    // that was Page 1

    PageViewModel(
      pageColor: const Color(0xFF17f0a4),
      body: Text(
        'Before choosing restrant or takeout, preview it in the map !',
      ),
      title: Text('Location and choice'),
      mainImage: Image.asset(
        'assets/images/Map.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'Capriola', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'Capriola', color: Colors.white),
    ),
    // that was Page 2

    PageViewModel(
      pageColor: const Color(0xFFf5cf69),
      body: Text(
        'Making a better choice of food you intake whenever you see the menu ! ',
      ),
      title: Text('See menus before you get in !'),
      mainImage: Image.asset(
        'assets/images/Menuonline.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'Capriola', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'Capriola', color: Colors.white),
    ),
    // that was Page 3

    PageViewModel(
      pageColor: const Color(0xFF9032f2),
      body: Text(
        'you can even Take a pictrue of your intake!',
      ),
      title: Text('See through your food'),
      mainImage: Image.asset(
        'assets/images/Food.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,

      ),
      titleTextStyle: TextStyle(fontFamily: 'Capriola', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'Capriola', color: Colors.white),
    ),
    // that was Page 4

    PageViewModel(
      pageColor: const Color(0xFFf786a8),
      body: Text(
        'This app will assist you based on how much calories you intake from the weekly summaray ',
      ),
      title: Text('Weekly reports '),
      mainImage: Image.asset(
        'assets/images/Weeklyreport.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'Capriola', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'Capriola', color: Colors.white),
    ),
    // that was Page 5  (animation transition awaits)
  ];

  Widget build(BuildContext context) {
    return IntroViewsFlutter(pages, showNextButton: true, showBackButton: true,
        onTapDoneButton: () {
      Navigator.pushNamed(context, WelcomeScreen.id);
    }, onTapSkipButton: () {
      Navigator.pushNamed(context, WelcomeScreen.id);
    },
        pageButtonTextStyles: TextStyle(
          fontFamily: 'Capriola',
          color: Colors.white,
          fontSize: 18.0,
        ));
  }
}
