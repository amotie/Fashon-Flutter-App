import 'package:flutter/material.dart';

class CostumTextField extends StatelessWidget {
  final String hintText;
  final bool hideText;
  final Function onSubmited;
  CostumTextField({this.hintText, @required this.hideText, this.onSubmited});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 45.0,
      ),
      child: TextFormField(
        obscureText: hideText,
        keyboardType: TextInputType.name,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          labelText: hintText, focusColor: Colors.red,

          // hoverColor: Color(0XFF2F3641),
          // hintText: hintText,
        ),
        style: TextStyle(
          
          fontWeight: FontWeight.bold,
        ),
        onFieldSubmitted: onSubmited,
        
      ),
    );
  }
}
