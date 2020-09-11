import 'package:flutter/material.dart';

class RoundedButtonWithImage extends StatelessWidget {
  RoundedButtonWithImage(
      {this.textStyle,
      this.imageLocation,
      this.title,
      this.colour,
      @required this.onPressed,
      this.width});
  final Color colour;
  final String title;
  final Function onPressed;
  final double width;
  final TextStyle textStyle;
  final String imageLocation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: width,
          height: 67.0,
          child: Row(
            children: <Widget>[
              Image.asset(
                imageLocation,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: textStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
