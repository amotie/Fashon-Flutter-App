import 'package:flutter/material.dart';

class CustemTextFormFiled extends StatelessWidget {
  final String label;
  final bool hideText;
  final String errorMessege;
  final Function onPressed;
  final Function hideButton;
  final Function onChanged;
  final TextInputType keyboardType;
  final TextEditingController controller;

  CustemTextFormFiled(
      {@required this.label,
      this.hideText,
      this.onPressed,
      this.keyboardType,
      this.errorMessege,
      this.hideButton,
      this.onChanged,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textInputAction: TextInputAction.next,
        onSubmitted: onPressed,
        onChanged: onChanged,
        obscureText: hideText == null ? false : hideText,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
        ),
        decoration: InputDecoration(
          errorText: errorMessege,
          suffixIcon: hideText == null
              ? null
              : hideText == true
                  ? IconButton(
                      icon: Icon(
                        Icons.visibility_off,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: hideButton)
                  : IconButton(
                      icon: Icon(
                        Icons.visibility,
                        color: Theme.of(context).primaryColor,
                      ),
                      onPressed: hideButton),
          labelText: label,
          labelStyle: TextStyle(color: Theme.of(context).primaryColor),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).accentColor,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
