import 'package:FashonApp/screens/home.dart';
import 'screens/signUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0XFF2F3641),
    ));
    return MaterialApp(
      title: 'Fashon',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0XFF17181A),
        // primaryColor: Color(0XFF2F3641),
        accentColor: Colors.grey,
        primaryColor: Color(0XFF2F3641),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0XFF2F3641),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        ),
      ),
      initialRoute: SignUp.id,
      routes: {
        Home.id: (context) => Home(),
        SignUp.id: (context) => SignUp(),
      },
    );
  }
}
