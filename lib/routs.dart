import 'package:flutter/widgets.dart';
import 'package:shop_app/screens/forgot_password/forgot_password.dart';
import 'package:shop_app/screens/login_success/login_success.dart';
import 'package:shop_app/screens/sign_in/sign_in.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';

// We use name route
//All our routes will be available
final Map<String, WidgetBuilder> routes = {

  SplashScreen.routeName:(context) =>SplashScreen(),
  SignInScreen.routeName:(context)=>SignInScreen(),
  ForgotPassword.routName:(context)=>ForgotPassword(),
  LoginSuccess.routeName:(context)=>LoginSuccess(),

};