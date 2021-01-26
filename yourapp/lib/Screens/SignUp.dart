import 'package:flutter/material.dart';

import 'package:auth_buttons/auth_buttons.dart';


import 'package:yourapp/Services/LoginService.dart';
import 'package:yourapp/Services/SignUpService.dart';
import 'package:yourapp/Validation.dart';
import 'package:yourapp/const.dart';
import 'package:yourapp/widegt/CustemRaisedButton.dart';
import 'package:yourapp/widegt/CustemTextFormFiled.dart';

class SignUp extends StatefulWidget {
  static const String id = 'SignUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool checkedValue = false;
  bool visable;
  bool emailValide, passwordValide, userValide, confermPasswordValide;
  String email = '', password = '', username = '', conferPassword = '';

  @override
  void initState() {
    visable = true;
    userValide = false;
    emailValide = false;
    passwordValide = false;
    confermPasswordValide = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: [
            headerWidget(),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustemTextFormFiled(
                      label: 'username',
                      keyboardType: TextInputType.name,
                      errorMessege: userValide ? userErrorMessege : null,
                      onPressed: (value) {
                        username = value;
                        userValide = Validation.userValidation(value);
                      },
                      onChanged: (value) => username = value,
                    ),
                    CustemTextFormFiled(
                      label: 'Your Email',
                      keyboardType: TextInputType.emailAddress,
                      errorMessege: emailValide ? emailErrorMessege : null,
                      onPressed: (value) {
                        setState(() {
                          email = value;
                          emailValide = Validation.emailValidation(value);
                        });
                      },
                      onChanged: (value) => email = value,
                    ),
                    CustemTextFormFiled(
                      label: 'Password',
                      hideText: visable,
                      hideButton: () {
                        setState(() {
                          visable = !visable;
                        });
                      },
                      errorMessege:
                          passwordValide ? passwordErrorMessege : null,
                      onPressed: (value) {
                        setState(() {
                          password = value;
                          passwordValide = Validation.passwordValidation(value);
                        });
                      },
                      onChanged: (value) => password = value,
                    ),
                    CustemTextFormFiled(
                      label: 'Conferm Password',
                      hideText: visable,
                      hideButton: () {
                        setState(() {
                          visable = !visable;
                        });
                      },
                      errorMessege: confermPasswordValide
                          ? confermPasswordErrorMessege
                          : null,
                      onPressed: (value) {
                        setState(() {
                          conferPassword = value;
                          confermPasswordValide =
                              Validation.confermPasswordValidation(
                                  value, password);
                        });
                      },
                      onChanged: (value) => conferPassword = value,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: CheckboxListTile(
                        activeColor: Color(0XFF2F3641),
                        title: Text(
                          "you agree the terms and privacy policy",
                        ),
                        value: checkedValue,
                        onChanged: (newValue) {
                          setState(() {
                            checkedValue = newValue;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 300.0,
                          child: Builder(
                            builder: (context) => CustemRaisedButton(
                              title: 'SIGN UP',
                              onPressed: () {
                                setState(() {
                                  SignUpService.signUp(context, username, email,
                                      password, conferPassword, checkedValue);
                                });
                              },
                            ),
                          )),
                    ),
                    diveder(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        FacebookAuthButton(
                            style: AuthButtonStyle.icon,
                            // borderRadius: 40.0,
                            buttonBorderWidth: 0.0,
                            onPressed: () {
                              LoginService.loginUsingFacebook(context);
                            }),
                        GoogleAuthButton(
                          style: AuthButtonStyle.icon,
                          // borderRadius: 40.0,
                          darkMode: true,
                          buttonBorderWidth: 0.0,
                          onPressed: () {
                            LoginService.loginUsingGoogle(context);
                          },
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding diveder() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45.0),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("OR"),
          ),
          Expanded(
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Expanded headerWidget() {
    return Expanded(
      flex: 1,
      child: Container(
        width: double.infinity,
        color: Color(0XFF2F3641),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Text(
                "Create your \nAccount ",
                // textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
