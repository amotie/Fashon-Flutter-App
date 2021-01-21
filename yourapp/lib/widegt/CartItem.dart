import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourapp/CartList.dart';
import 'package:yourapp/widegt/Counter.dart';

class CartItem extends StatelessWidget {
  final int index;
  final Function onClose;
  const CartItem({@required this.index,@required this.onClose});

  @override
  Widget build(BuildContext context) {
    var store = context.watch<CartList>();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100.0,
            height: 100.0,
            child: Image.network(store.cart[index].imagePath),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(store.cart[index].name),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  store.cart[index].brand,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor, fontSize: 10.0),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 20.0),
                child: Text(
                  store.cart[index].price,
                  style: TextStyle(
                      color: Theme.of(context).accentColor, fontSize: 10.0),
                ),
              )
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(icon: Icon(Icons.close), onPressed: onClose),
              SizedBox(
                height: 30.0,
              ),
              Counter(
                index: index,
              )
            ],
          )
        ],
      ),
    );
  }
}
