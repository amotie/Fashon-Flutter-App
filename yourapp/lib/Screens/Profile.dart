import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static const String id = 'Profile';

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF171719),
        elevation: 0,
        centerTitle: true,
        title: Text(
          'PROFILE',
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 3,
            color: Color(0xFF171719),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(
                    'https://cdn3.iconfinder.com/data/icons/business-avatar-1/512/11_avatar-256.png',
                  ),
                  backgroundColor: Colors.transparent,
                ),
                Text(
                  'Ali Motie',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Theme.of(context).accentColor,
                    fontSize: 25.0,
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.start,
                ),
                Divider(
                  indent: 185.0,
                  endIndent: 185.0,
                  thickness: 2,
                  color: Theme.of(context).accentColor,
                ),
                Text(
                  'amotie@outlook.com',
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Theme.of(context).accentColor,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'Roboto',
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('My address'),
            trailing: Text(
              '123, Royal Steet, Sydney',
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Theme.of(context).primaryColor,
                fontSize: 12.0,
                fontWeight: FontWeight.w100,
                fontFamily: 'Roboto',
              ),
            ),
          ),
          Divider(
            color: Theme.of(context).accentColor,
            indent: 40.0,
            endIndent: 40.0,
          )
        ],
      ),
    );
  }
}
