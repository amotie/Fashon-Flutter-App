import 'package:flutter/material.dart';

class DropDownMenu extends StatelessWidget {
  final List items;
  final Function onChanged;
  final String title;
  final String selctedItemDropDown;
  final bool sepratre;
  DropDownMenu(
      {@required this.items,
      @required this.onChanged,
      @required this.title,
      @required this.selctedItemDropDown,
      this.sepratre});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            title,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              iconEnabledColor: Colors.white,
              items: items.map((e) {
                return DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ));
              }).toList(),
              onChanged: onChanged,
              value: selctedItemDropDown,
            ),
          ),
        )
      ],
    );
  }
}
