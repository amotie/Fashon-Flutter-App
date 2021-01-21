import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yourapp/CartList.dart';
import 'package:yourapp/Screens/Cart.dart';
import 'package:yourapp/Screens/Home.dart';
import 'package:yourapp/Screens/Login.dart';
import 'package:yourapp/Screens/Profile.dart';

class DrawerScreen extends StatelessWidget {
  final fontSize = 20.0;
  @override
  Widget build(BuildContext context) {
    var store = context.watch<CartList>();
    return Container(
      color: Color(0xFF171715),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Profile.id),
            child: Stack(
              children: [
                Positioned(
                  top: 100.0,
                  left: 20.0,
                  child: CircleAvatar(
                    radius: 40.0,
                    backgroundImage: NetworkImage(
                      'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/11_avatar-256.png',
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Positioned(
                  top: 120.0,
                  left: 100.0,
                  child: Text(
                    'Ali Motie',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Theme.of(context).accentColor,
                      fontSize: 15.0,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Positioned(
                  top: 140.0,
                  left: 100.0,
                  child: Text(
                    'amotie@outlook.com',
                    style: TextStyle(
                      decoration: TextDecoration.none,
                      color: Theme.of(context).primaryColor,
                      fontSize: 10.0,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Roboto',
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              height: 400.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Home.id);
                      },
                      child: Text(
                        'Explore',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Theme.of(context).accentColor,
                          fontSize: fontSize,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Wishlist',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Theme.of(context).accentColor,
                          fontSize: fontSize,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Cart.id);
                      },
                      child: Badge(
                        showBadge: store.hasData(),
                        badgeColor: Theme.of(context).accentColor,
                        position: BadgePosition.topEnd(top: -15, end: -30),
                        badgeContent: Text(
                          store.getCartItemsCount().toString(),
                          style: TextStyle(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                        ),
                        child: Text(
                          'My Cart',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Theme.of(context).accentColor,
                            fontSize: fontSize,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Search',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Theme.of(context).accentColor,
                          fontSize: fontSize,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Theme.of(context).accentColor,
                          fontSize: fontSize,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        SharedPreferences preferences =
                            await SharedPreferences.getInstance();
                        await preferences.clear();
                        Navigator.popAndPushNamed(context, Login.id);
                      },
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Theme.of(context).accentColor,
                          fontSize: fontSize,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
// Image.network(
//                 'https://www.flaticon.com/premium-icon/icons/svg/924/924915.svg',
//                 fit: BoxFit.cover,
//               ),
