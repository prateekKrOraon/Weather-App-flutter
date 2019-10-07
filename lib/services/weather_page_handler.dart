import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';


const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';
const apiKey = 'bb68b56c3023b65ec93ad9d5278769fe';

class WeatherPageHandler{

  Future<dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url:'$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric'
    );

    var weatherData = await networkHelper.getData();

    return weatherData;
  }


  String temperature;
  String cityName;
  String countryCode;
  String visibility;
  String maxTemp;
  String windSpeed;
  String description;
  int id;
  String day;
  String time;
  IconData icon;
  String humidity;
  Color colorScheme;

  var now = DateTime.now();

  void setData(dynamic weatherData){

    id = weatherData['weather'][0]['id'];
    temperature = "${weatherData['main']['temp'].toString()} °C";
    cityName = weatherData['name'];
    countryCode = weatherData['sys']['country'];
    day = dayHandler(now.weekday);
    time = timeHandler(now.hour,now.minute);
    icon = iconHandler(id);
    description = weatherData['weather'][0]['description'].toString();
    humidity = "${weatherData['main']['humidity']} %";
    visibility = "${weatherData['visibility']} m";
    maxTemp = "${weatherData['main']['temp_max']} °C";
    colorScheme = colorSchemeHandler();
    windSpeed = "${weatherData['wind']['speed']} m/s";
    print(weatherData);

  }

  Color colorSchemeHandler(){

    Color color;

    if(now.hour>6 && now.hour<18){

      if(description == 'Thunderstorm'){
        color = Colors.blueGrey[900];
      }else if(description == 'Drizzle'){
        color = Colors.blueGrey[700];
      }else if(description == 'Rain'){
        color = Colors.blueGrey[500];
      }else if(description == 'Clear'){
        color = Colors.orangeAccent;
      }else if(description == 'clouds'){
        color = Colors.grey[700];
      }else{
        color = Colors.grey[600];
      }

    }else{
      color = Colors.black;
    }

    return color;

  }

  IconData iconHandler(int id){

    IconData icon;

    if(now.hour>6 && now.hour<18){
      if(id<300){
        icon = WeatherIcons.day_thunderstorm;
      }else if(id<400){
        icon = WeatherIcons.day_rain_mix;
      }else if(id<600){
        icon = WeatherIcons.day_rain;
      }else if(id<700){
        icon = WeatherIcons.day_snow;
      }else if(id<800){
        icon = WeatherIcons.day_cloudy;
      }else if(id>800 && id<900){
        icon = WeatherIcons.day_cloudy;
      }else if(id == 800){
        icon = WeatherIcons.day_sunny;
      }
    }else{
      if(id<300){
        icon = WeatherIcons.night_alt_thunderstorm;
      }else if(id<400){
        icon = WeatherIcons.night_alt_rain_mix;
      }else if(id<600){
        icon = WeatherIcons.night_alt_rain;
      }else if(id<700){
        icon = WeatherIcons.night_alt_snow;
      }else if(id<800){
        icon = WeatherIcons.night_alt_cloudy;
      }else if(id>800 && id<900){
        icon = WeatherIcons.night_alt_cloudy;
      }else if(id == 800){
        icon = WeatherIcons.night_clear;
      }
    }

    return icon;
  }

  String timeHandler(int hr,int mn){
    int hour;
    int min = mn;
    String time;

    if(hr>0 && hr<=12){
      hour = hr;
      time = "$hour:$min AM";
    }else if(hr>12){
      hour = hr%12;
      time = "$hour:$min PM";
    }else{
      hour = 12;
      time = "$hour:$min AM";
    }

    return time;
  }

  String dayHandler(int value){
    String day;
    switch(value){
      case 1:
        day = 'Monday';
        break;
      case 2:
        day = 'Tuesday';
        break;
      case 3:
        day = 'Wednesday';
        break;
      case 4:
        day = 'Thursday';
        break;
      case 5:
        day = 'Friday';
        break;
      case 6:
        day = 'Saturday';
        break;
      case 7:
        day = 'Sunday';
        break;
      default:
        day = 'Error';
    }
    return day;
  }

}