import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_page_handler.dart';

class SearchCityScreen extends StatefulWidget{
  @override
  _SearchCityScreenState createState() => _SearchCityScreenState();

}

class _SearchCityScreenState extends State<SearchCityScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        //backgroundColor: ,
      ),
    );
  }

}