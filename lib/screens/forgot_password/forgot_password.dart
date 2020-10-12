import 'package:flutter/material.dart';
import 'package:shop_app/screens/forgot_password/components/body.dart';

class ForgotPassword extends StatelessWidget {

  static String routName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot"),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
