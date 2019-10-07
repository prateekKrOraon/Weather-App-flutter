import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constants.dart';

class SearchCityScreen extends StatefulWidget{

  SearchCityScreen({this.colorScheme});

  final Color colorScheme;

  @override
  _SearchCityScreenState createState() => _SearchCityScreenState();

}

class _SearchCityScreenState extends State<SearchCityScreen>{

  Color colorScheme;
  String cityName;
  @override
  void initState() {
    super.initState();
    this.colorScheme = widget.colorScheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorScheme,
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: colorScheme,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              TextField(
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: kInputTextFieldDecoration,
                onChanged: (value){
                  cityName = value;
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
                  color: colorScheme,
                  shape: buttonShape,
                  splashColor: Colors.grey,
                  child: Text(
                    "Get Weather",
                    style: buttonTextStyle,
                  ),
                  onPressed: (){
                    Navigator.pop(context,cityName);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}