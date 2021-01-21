import 'package:flutter/material.dart';

class CustemRaisedButton extends StatelessWidget {
  final String title;

  final Function onPressed;
  CustemRaisedButton({
    @required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      padding: const EdgeInsets.only(
          top: 16.0, bottom: 8.0, left: 20.0, right: 20.0),
      child: RaisedButton(
        color: Theme.of(context).accentColor,
        textColor: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
      ),
    );
  }
}
