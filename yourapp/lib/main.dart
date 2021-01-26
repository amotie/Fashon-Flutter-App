import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yourapp/CartList.dart';
import 'package:yourapp/Screens/Cart.dart';
import 'package:yourapp/Screens/Catigory.dart';
import 'package:yourapp/Screens/Payment.dart';
import 'package:yourapp/Screens/Profile.dart';
import 'package:yourapp/Screens/SignUp.dart';

import 'Screens/Login.dart';
import 'Screens/Home.dart';
import 'Screens/ProductDetails.dart';
import 'Screens/Catigory.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final pref = await SharedPreferences.getInstance();

  runApp(MyApp(pref.containsKey('token')));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final bool isLogedIn;
  MyApp(this.isLogedIn);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF0C0C0C),
          primaryColor: Color(0xFFA8A8A8),
          accentColor: Color(0xFFEDEDED),

          appBarTheme: AppBarTheme(
              color: Color(0xFF0C0C0C),
              iconTheme: IconThemeData(
                color: Color(0xFFEDEDED),
              )),
          // fontFamily: 'Roboto',
        ),
        initialRoute: isLogedIn ? Home.id : Login.id,
        routes: {
          Login.id: (context) => Login(),
          Home.id: (context) => Home(),
          ProductDetails.id: (context) => ProductDetails(),
          Catigory.id: (context) => Catigory(),
          Cart.id: (context) => Cart(),
          Payment.id: (context) => Payment(),
          Profile.id: (context) => Profile(),
          SignUp.id: (context) => SignUp(),
          // Shipping.id : (context) => Shipping(),
        },
      ),
    );
  }
}
