import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const kInputTextFieldDecoration = InputDecoration(

  fillColor: Colors.white,
  filled: true,
  icon: Icon(
    FontAwesomeIcons.city,
    color: Colors.white,
  ),
  hintText: "Enter City Name",
  hintStyle: TextStyle(
    color: Colors.grey,
    //fontSize: 20.0,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(10.0)),
    borderSide: BorderSide.none,
  ),
);

const textStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.normal,
);

const buttonTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.normal,
  fontSize: 23.0,
  color: Colors.white,
);

const buttonShape = StadiumBorder(
    side: BorderSide(
      width: 1.0,
      color: Colors.white,
    )
);

const bottomRowTextStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontWeight: FontWeight.normal,
  fontSize: 20.0,
);

const bottomRowValueStyle = TextStyle(
  fontFamily: 'Montserrat',
  fontSize: 30.0,
  fontWeight: FontWeight.bold,
);