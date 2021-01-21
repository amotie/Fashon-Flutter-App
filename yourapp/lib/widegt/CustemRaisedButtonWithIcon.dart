import 'package:flutter/material.dart';

class CustemRaisedButtonWithIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onPressed;
  CustemRaisedButtonWithIcon({@required this.icon, @required this.label, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      padding: const EdgeInsets.only(
          top: 16.0, bottom: 8.0, left: 20.0, right: 20.0),
      child: RaisedButton.icon(
        onPressed: onPressed,
        icon: Text(
          label,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w400),
        ),
        label: Icon(
          icon,
          size: 40.0,
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        textColor: Theme.of(context).accentColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: Theme.of(context).accentColor,
            )),
      ),
    );
  }
}
