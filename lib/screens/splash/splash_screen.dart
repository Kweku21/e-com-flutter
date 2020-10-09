import 'package:flutter/material.dart';
import 'package:shop_app/screens/splash/components/body.dart';
import 'package:shop_app/size_config.dart';

class SplashScreen extends StatefulWidget {

  static String routeName ="/splash";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  Widget build(BuildContext context) {
    // You gave to call it on your starting page
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
