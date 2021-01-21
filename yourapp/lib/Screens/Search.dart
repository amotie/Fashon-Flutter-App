import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:yourapp/model/ItemModel.dart';

import 'ProductDetails.dart';

class Search extends SearchDelegate {
  Search(BuildContext context) {
    getList(context);
  }
  List<ItemModel> items = [];
  Future getList(BuildContext context) async {
    var list =
        await DefaultAssetBundle.of(context).loadString('assets/products.json');
    var products = json.decode(list);
    for (var product in products) {
      items.add(ItemModel.fromJson(product));
    }
    print(items);
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context)
        .copyWith(primaryColor: Theme.of(context).scaffoldBackgroundColor);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var searchList = query.isEmpty
        ? items
        : items
            .where((element) =>
                element.name.toLowerCase().startsWith(query.toLowerCase()))
            .toList();
    return ListView.builder(
        itemCount: searchList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchList[index].name),
            onTap: () {
              close(context, null);
              Navigator.pushNamed(context, ProductDetails.id,
                  arguments: searchList[index]);
            },
          );
        });
  }
}
