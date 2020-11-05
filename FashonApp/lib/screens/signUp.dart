import 'package:flutter/material.dart';
import 'package:FashonApp/components/costomTextField.dart';
import 'package:FashonApp/model/userModel.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class SignUp extends StatefulWidget {
  static const String id = 'SignUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  User user = User();
  bool checkedValue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
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
            ),
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CostumTextField(
                      hintText: 'username',
                      hideText: false,
                      onSubmited: (value) {
                        user.username = value;
                      },
                    ),
                    CostumTextField(
                      hintText: 'email',
                      hideText: false,
                      onSubmited: (value) {
                        user.email = value;
                      },
                    ),
                    CostumTextField(
                      hintText: 'password',
                      hideText: true,
                      onSubmited: (value) {
                        user.password = value;
                      },
                    ),
                    CostumTextField(
                      hintText: 'conferm password',
                      hideText: true,
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
                        child: RaisedButton(
                          onPressed: () {},
                          child: Text('SignUp'),
                        ),
                      ),
                    ),
                    Padding(
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
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: SizedBox(
                          width: 300.0,
                          child: FacebookSignInButton(
                            centered: true,
                            borderRadius: 40.0,
                            onPressed: () {},
                          )),
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
}
