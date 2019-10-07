import 'package:flutter/material.dart';
import 'screens/home_page.dart';

void main() => runApp(WeatherApp());

class WeatherApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      theme: ThemeData.dark().copyWith(
        backgroundColor: Color(0xFFFFA000),
        accentColor: Colors.white,
      ),
      home: LoadingScreen(),
    );
  }

}
