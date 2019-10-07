import 'package:weather_app/screens/search_city_screen.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_page_handler.dart';
import 'package:weather_app/utilities/bottom_row_tile.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "${curWeather.cityName}, ${curWeather.countryCode}",
                    style: textStyle.copyWith(
                      fontSize: 50.0,
                    ),
                  ),
                  Text(
                    "${curWeather.day}, ${curWeather.time}",
                    style: textStyle.copyWith(
                      fontSize: 23.0,
                    )
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
                    style: textStyle.copyWith(
                      fontSize: 100.0,
                    ),
                  ),
                  Text(
                    curWeather.description,
                    style: textStyle.copyWith(
                      fontSize: 23.0,
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
                        ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Refresh Data",
                        style: textStyle.copyWith(
                          fontSize: 23.0,
                          color: Colors.white,
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
                      BottomRowTile(
                        icon: WeatherIcons.wind_direction,
                        title: "Wind",
                        value: curWeather.windSpeed,
                      ),//wind speed
                      BottomRowTile(
                        icon: WeatherIcons.humidity,
                        title: "Humidity",
                        value: curWeather.humidity,
                      ),
                      BottomRowTile(
                        icon: WeatherIcons.thermometer,
                        title: "Feels Like",
                        value: curWeather.maxTemp,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                    child: RaisedButton(
                      color: colorScheme,
                      splashColor: Colors.grey,
                      shape: buttonShape,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Different City?",
                          style: buttonTextStyle
                        ),
                      ),
                      onPressed: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SearchCityScreen(
                              colorScheme: colorScheme
                            ),
                          ),
                        );
                      },
                    ),
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