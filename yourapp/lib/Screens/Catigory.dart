import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:yourapp/Screens/ProductDetails.dart';
import 'package:yourapp/model/ItemModel.dart';
import 'package:yourapp/widegt/CatigoryItem.dart';
import 'package:provider/provider.dart';
import '../CartList.dart';
import 'Cart.dart';
import 'Search.dart';

class Catigory extends StatefulWidget {
  static const String id = 'Catigory';

  @override
  _CatigoryState createState() => _CatigoryState();
}

class _CatigoryState extends State<Catigory> {
  List<ItemModel> items = [];
  @override
  void initState() {
    getList(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var store = context.watch<CartList>();
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Catigorys",
          ),
          actions: [
            Badge(
              showBadge: store.hasData(),
              badgeColor: Colors.red,
              position: BadgePosition.topEnd(top: 5, end: 0),
              badgeContent: Text(store.getCartItemsCount().toString()
                  // style: TextStyle(fontSize: 10),
                  ),
              child: IconButton(
                icon: Icon(Icons.shopping_bag_rounded),
                onPressed: () {
                  print('asffsa');
                  Navigator.pushNamed(context, Cart.id);
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: Search(context));
              },
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Theme.of(context).accentColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Container(
                width: 100.0,
                child: Tab(text: 'New In'),
              ),
              Container(width: 100.0, child: Tab(text: 'Tops')),
              Container(width: 100.0, child: Tab(text: 'Pants')),
              Container(width: 100.0, child: Tab(text: 'Shorts')),
              Container(width: 100.0, child: Tab(text: 'jackets')),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _gridView(),
            _gridView(),
            _gridView(),
            _gridView(),
            _gridView()
          ],
        ),
      ),
    );
  }

  Widget _gridView() {
    return items.isEmpty
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            physics: ScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                // mainAxisSpacing: 10.0,
                childAspectRatio: 9 / 16),
            itemBuilder: (context, index) {
              return CatigoryItem(
                imagePath: items[index].imageUrls.first,
                brand: items[index].brand,
                name: items[index].name,
                price: items[index].price,
                onPressed: () {
                  Navigator.pushNamed(context, ProductDetails.id,
                      arguments: items[index]);
                },
              );
            });
  }

  Future getList(BuildContext context) async {
    var list =
        await DefaultAssetBundle.of(context).loadString('assets/products.json');
    var products = json.decode(list);
    for (var product in products) {
      setState(() {
        items.add(ItemModel.fromJson(product));
      });
    }
    print(items);
  }
}
