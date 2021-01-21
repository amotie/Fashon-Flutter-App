import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourapp/CartList.dart';
import 'package:yourapp/Screens/Payment.dart';

import 'package:yourapp/const.dart';
import 'package:yourapp/widegt/CartItem.dart';
import 'package:yourapp/widegt/CustemRaisedButton.dart';

class Cart extends StatefulWidget {
  static const String id = 'Cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    var store = context.watch<CartList>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'CHECK OUT',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            cartItems(context, store),
            Divider(
              color: Theme.of(context).accentColor,
              indent: 40.0,
              endIndent: 40.0,
            ),
            subtotal(context, store),
            Divider(
              color: Theme.of(context).primaryColor,
              indent: 40.0,
              endIndent: 40.0,
            ),
            standedShipping(context),
            Divider(
              color: Theme.of(context).primaryColor,
              indent: 40.0,
              endIndent: 40.0,
              thickness: 4.0,
            ),
            totalPrice(context, store),
            Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: CustemRaisedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Payment.id);
                },
                title: 'PLACE ORDER',
              ),
            )
          ],
        ));
  }

  Padding totalPrice(BuildContext context, CartList store) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ListTile(
        title: Text(
          'Total amount',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
        ),
        trailing: Text(
          '\$ ${store.totalPrice()}',
          style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
              fontSize: 15.0),
        ),
      ),
    );
  }

  Padding standedShipping(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          childrenPadding: EdgeInsets.zero,
          title: Text(
            'Standed Shipping (3-7 bussines days)',
            style: TextStyle(
                color: Theme.of(context).accentColor,
                fontWeight: FontWeight.bold,
                fontSize: 13.0),
          ),
          children: [
            Divider(
              color: Theme.of(context).primaryColor,
              indent: 19.0,
              endIndent: 19.0,
            ),
            ListTile(
              title: Text(
                'Shipping',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0),
              ),
              trailing: Text(
                shippingFee,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
            ),
            ListTile(
              title: Text(
                'Estmited Tax',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0),
              ),
              trailing: Text(
                estimatedTax,
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding subtotal(BuildContext context, CartList store) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: ListTile(
        title: Text(
          'Subtotal',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w300,
              fontSize: 12.0),
        ),
        trailing: Text(
          '\$ ${store.calculateSubTotalPrice()}',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 12.0),
        ),
      ),
    );
  }

  Container cartItems(BuildContext context, CartList store) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.38,
      child: ListView.builder(
          itemCount: store.getLength(),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Divider(
                  color: Theme.of(context).accentColor,
                  indent: 40.0,
                  endIndent: 40.0,
                ),
                CartItem(
                  index: index,
                  onClose: () {
                    setState(() {
                      store.removeFromCart(index);
                    });
                  },
                ),
              ],
            );
          }),
    );
  }
}
