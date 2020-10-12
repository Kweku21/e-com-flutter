import 'package:flutter/material.dart';
import 'package:shop_app/components/custom_svg_icon.dart';
import 'package:shop_app/components/default_button.dart';
import 'package:shop_app/components/form_error.dart';
import 'package:shop_app/screens/forgot_password/forgot_password.dart';
import 'package:shop_app/screens/login_success/login_success.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String email;
  String password;
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),

          SizedBox(height: getProportionateScreenHeight(20),),

          buildPasswordFormField(),

          SizedBox(height: getProportionateScreenHeight(20),),

          Row(
            children: [
              Checkbox(
                activeColor: kPrimaryColor,
                value: rememberMe,
                onChanged: (value){
                  setState(() {
                    rememberMe = value;
                  });
                },
              ),
              Text("Remember Me"),

              Spacer(),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, ForgotPassword.routName);
                },
                child: Text(
                  "Forgot Password",
                  style: TextStyle(
                      decoration: TextDecoration.underline
                  ),
                ),
              )
            ],
          ),

          FormError(errors: errors),

          SizedBox(height: getProportionateScreenHeight(20),),

          DefualtButton(text: "Continue", press: (){

            if(_formKey.currentState.validate()){
              _formKey.currentState.save();

              return Navigator.pushNamed(context, LoginSuccess.routeName);
            }
          })
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
          hintText: "Enter your password",
          labelText: "Password",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CuttomSurffixIcon(
            svgIcon: "assets/icons/Lock.svg",
          )

      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      onChanged: (value){

        if(value.isEmpty && errors.contains(kEmailNullError)){
          setState(() {
            errors.remove(kEmailNullError);
          });
        }else if(emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
          setState(() {
            errors.remove(kInvalidEmailError);
          });
        }

        return null;
      },

      onSaved: (newValue) => email = newValue,
      validator: (value){

        if(value.isEmpty && !errors.contains(kEmailNullError)){
          setState(() {
            errors.add(kEmailNullError);
          });
        }else if(!emailValidatorRegExp.hasMatch(value) && !errors.contains(kInvalidEmailError)){
          setState(() {
            errors.add(kInvalidEmailError);
          });
        }

        return null;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          hintText: "Enter your email",
          labelText: "Email",
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CuttomSurffixIcon(
            svgIcon: "assets/icons/Mail.svg",
          )

      ),
    );
  }

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
}