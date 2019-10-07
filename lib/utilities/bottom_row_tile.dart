import 'package:flutter/material.dart';
import 'constants.dart';

class BottomRowTile extends StatelessWidget{

  BottomRowTile({this.icon, this.title, this.value});

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        children: <Widget>[
          Icon(icon),
          SizedBox(
            height: 20.0,
          ),
          Text(
            title,
            style: bottomRowTextStyle,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            value,
            style: bottomRowValueStyle,
          ),
        ],
      ),
    );
  }

}