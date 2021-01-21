import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourapp/CartList.dart';

class Counter extends StatefulWidget {
  final int index;
  Counter({this.index});

  @override
  _CounterState createState() => _CounterState(index: index);
}

class _CounterState extends State<Counter> {
  int index;
  _CounterState({this.index});

  @override
  Widget build(BuildContext context) {
    var store = context.watch<CartList>();
    return Container(
      width: 80.0,
      height: 30.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: Theme.of(context).accentColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () {
              store.subtractCount(index);
            },
            child: Icon(
              Icons.remove,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
          Text(
            store.cart[index].count.toString(),
            style: TextStyle(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.bold),
          ),
          GestureDetector(
            onTap: () {
              store.addCount(index);
            },
            child: Icon(
              Icons.add,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
