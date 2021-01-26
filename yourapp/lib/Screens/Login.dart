import 'package:flutter/material.dart';
import 'package:yourapp/Services/LoginService.dart';
import 'package:yourapp/widegt/CustemRaisedButton.dart';
import 'package:yourapp/widegt/CustemTextFormFiled.dart';
import 'package:flutter/cupertino.dart';
import 'package:yourapp/Validation.dart';
import 'package:yourapp/const.dart';

class Login extends StatefulWidget {
  static const String id = 'Login';
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool visable, switchON;
  bool emailValide, passwordValide;
  String email = '', password = '';

  @override
  void initState() {
    visable = true;
    switchON = true;
    emailValide = false;
    passwordValide = false;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Log In",
              style: TextStyle(
                fontFamily: 'Castoro',
                color: Theme.of(context).accentColor,
                fontSize: 30.0,
              ),
              textAlign: TextAlign.center,
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
              errorMessege: passwordValide ? passwordErrorMessege : null,
              onPressed: (value) {
                setState(() {
                  password = value;
                  passwordValide = Validation.passwordValidation(value);
                });
              },
              onChanged: (value) => password = value,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 8.0,
              ),
              child: Row(
                children: [
                  CupertinoSwitch(
                    value: switchON,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (bool value) {
                      setState(() {
                        switchON = value;
                      });
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      'Remember',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Spacer(),
                  Text('Forget Password?',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      )),
                ],
              ),
            ),
            CustemRaisedButton(
                title: 'LOG IN',
                onPressed: () {
                  setState(() {
                    LoginService.loginUsingEmail(
                        context, email, password, switchON);
                  });
                }),
          ],
        ),
      ),
    );
  }
}
