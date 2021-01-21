import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_brand_icons/flutter_brand_icons.dart';
import 'package:yourapp/Services/paymentService.dart';
import 'package:yourapp/const.dart';
import 'package:provider/provider.dart';
import 'package:yourapp/widegt/CreditCard.dart';
import 'package:yourapp/widegt/CustemRaisedButton.dart';
import 'package:yourapp/widegt/CustemRaisedButtonWithIcon.dart';
import '../CartList.dart';

class Payment extends StatefulWidget {
  static const String id = 'Payment';

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    var store = context.watch<CartList>();
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'PAYMENT',
            style: TextStyle(fontWeight: FontWeight.w300),
          ),
        ),
        body: ListView(
          children: [
            shippingAddress(context),
            paymentMethods(context),
            Divider(
              color: Theme.of(context).primaryColor,
              indent: 20.0,
              endIndent: 20.0,
            ),
            shippingWidget(context),
            taxWidget(context),
            Divider(
              color: Theme.of(context).primaryColor,
              indent: 20.0,
              endIndent: 20.0,
              thickness: 4.0,
            ),
            totalPrice(context, store),
            CustemRaisedButton(
              title: 'PLACE ORDER',
              onPressed: () {},
            ),
            Theme.of(context).platform == TargetPlatform.android
                ? CustemRaisedButtonWithIcon(
                    icon: BrandIcons.googlepay,
                    label: 'Buy With',
                    onPressed: () {
                      StripeService.payWithNativePayment(
                          currency: 'USD', amount: store.totalPrice());
                    })
                : CustemRaisedButtonWithIcon(
                    icon: BrandIcons.applepay,
                    label: 'But With',
                    onPressed: () {
                      StripeService.payWithNativePayment(
                          currency: 'USD', amount: store.totalPrice());
                    },
                  ),
          ],
        ));
  }

  Padding taxWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        title: Text(
          'Tax',
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
    );
  }

  Padding shippingWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
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
    );
  }
}

Padding totalPrice(BuildContext context, CartList store) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
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

Padding paymentMethods(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Pay with card',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            FlatButton.icon(
              icon: Text(
                'Add',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
              label: Icon(Icons.add),
            ),
          ],
        ),
        CarouselSlider.builder(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int itemIndex) {
            return CreditCard(
              number: cards[itemIndex].number,
              date: cards[itemIndex].expMonth.toString() +
                  '/' +
                  cards[itemIndex].expYear.toString(),
              name: cards[itemIndex].name,
            );
          },
          options: CarouselOptions(
            initialPage: 0,
            height: 250.0,
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
          ),
        )
      ],
    ),
  );
}

Padding shippingAddress(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Shepping Address',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            FlatButton(
                onPressed: () {},
                child: Text(
                  'Change',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Text('Unit 10, 2F, 123 York Street'),
        SizedBox(
          height: 10.0,
        ),
        Text(
          'Sydney NSW 2000',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    ),
  );
}
