import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return 
      SafeArea(
        child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              children: <Widget>[
                Text("Tokoto", style: TextStyle(
                  fontSize: getProportionateScreenWidth(26),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),)
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child:SizedBox(),
          ),
        ],
    ),
      );
  }
}
