import 'package:flutter/material.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeConfig.screenHeight * 0.04,
        ),
        Image.asset(
            "assets/images/success.png",
          height: SizeConfig.screenHeight*0.4,
          width: SizeConfig.screenWidth,
        ),

        SizedBox(
          height: SizeConfig.screenHeight * 0.08,
        ),

        Text(
          "Login Success",
          style: TextStyle(
            fontSize: getProportionateScreenWidth(30),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),

        Spacer(),

        SizedBox(
          width: SizeConfig.screenWidth * 0.6,
          child: DefualtButton(
              text: "Back to Home",
              press: (){

              }
          ),
        ),

        Spacer(),
      ],
    );
  }
}
