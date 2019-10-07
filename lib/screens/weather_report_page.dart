import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_page_handler.dart';

class WeatherReportPage extends StatefulWidget{

  WeatherReportPage({this.locationWeather});

  final locationWeather;

  @override
  _WeatherReportPageState createState() => _WeatherReportPageState();

}

class _WeatherReportPageState extends State<WeatherReportPage>{

  Color colorScheme;
  String cityName;
  String countryCode;
  String day;
  String time;
  IconData weatherIcon;
  String temperature;
  String description;
  String humidity;
  String visibility;
  String feelsLike;

  WeatherPageHandler curWeather = WeatherPageHandler();

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weather){
    setState(() {
      curWeather.setData(weather);
      colorScheme = curWeather.colorScheme;
      cityName = curWeather.cityName;
      day = curWeather.day;
      time = curWeather.time;
      weatherIcon = curWeather.icon;
      temperature = curWeather.temperature;
      description = curWeather.description;
      visibility = curWeather.visibility;
      humidity = curWeather.humidity;
      feelsLike = curWeather.maxTemp;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: curWeather.colorScheme,
      appBar: AppBar(
        title: Text(
          "Weather",
        ),
        backgroundColor: curWeather.colorScheme,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "${curWeather.cityName}, ${curWeather.countryCode}",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 50.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    "${curWeather.day}, ${curWeather.time}",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 23.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),//City name, country code, day and time
              Icon(
                curWeather.icon,
                size: 150.0,
              ),//Weather icon
              Column(
                children: <Widget>[
                  Text(
                    curWeather.temperature,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 100.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  Text(
                    curWeather.description,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 23.0,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: colorScheme,
                    splashColor: Colors.grey,
                    shape: StadiumBorder(
                        side: BorderSide(
                          width: 1.0,
                          color: Colors.white,
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Refresh Data",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 23.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    onPressed: () async {
                      var weather = await curWeather.getLocationWeather();
                      updateUI(weather);
                    },
                  ),
                ],
              ),//Temperature, description and refresh button
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 30.0),
                    child: Container(
                      width: 250.0,
                      height: 4.0,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Icon(WeatherIcons.wind_direction),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Wind",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              curWeather.windSpeed,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),//wind speed
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Icon(WeatherIcons.humidity),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Humidity",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              curWeather.humidity,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Icon(WeatherIcons.thermometer),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "Feels Like",
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 20.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              curWeather.maxTemp,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 30.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),//wind, humidity and feels ike
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}