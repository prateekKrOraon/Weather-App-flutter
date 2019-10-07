import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_app/screens/weather_report_page.dart';
import 'package:weather_app/services/weather_page_handler.dart';


class LoadingScreen extends StatefulWidget{
  @override
  _LoadingScreenState createState() => _LoadingScreenState();

}

class _LoadingScreenState extends State<LoadingScreen>{

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {

    var weatherData = await WeatherPageHandler().getLocationWeather();

    if(weatherData==null){
      showDialog<String>(context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("Something Went wrong"),
          content: Text(
            "Please check if your internet connection/location service is active."
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("Exit"),
              onPressed: () => exit(0),
            ),
            FlatButton(
              child: Text("Retry"),
              onPressed: () {
                this.getLocationData();
                Navigator.pop(context,'Retry');
              },
            ),
          ]
        ),
      );
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => WeatherReportPage(
          locationWeather: weatherData,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFA000),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              children: <Widget>[
                Icon(
                  WeatherIcons.day_cloudy,
                  size: 200.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                Text(
                  "Weather App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.mapMarkerAlt,
                  size: 40.0,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Text(
                    "Fetching Current Location",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25.0,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Color(0xFFFFA000),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}