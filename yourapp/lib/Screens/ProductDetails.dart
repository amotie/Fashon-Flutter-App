import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourapp/CartList.dart';
import 'package:yourapp/Screens/Cart.dart';
import 'package:yourapp/model/CartModel.dart';
import 'package:yourapp/model/ItemModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yourapp/widegt/CustemRaisedButton.dart';
import 'package:yourapp/widegt/DropDownMenu.dart';
import 'package:yourapp/Validation.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:badges/badges.dart';

class ProductDetails extends StatefulWidget {
  static const String id = 'ProductDetails';

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  IconData favorite = Icons.favorite_border;
  ItemModel product;
  int _current = 0;
  String selctedColor;
  String selctedSize;

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context).settings.arguments;
    product.colors = Validation.checkDropMenu(product.colors);
    product.sizes = Validation.checkDropMenu(product.sizes);
    var store = context.watch<CartList>();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(context),
          SliverList(
              delegate: SliverChildListDelegate([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 40.0),
                  child: Text(
                    product.name,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0, right: 40.0),
                  child: Text(
                    product.price,
                    style: TextStyle(
                      color: Theme.of(context).accentColor,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Text(
                product.brand,
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 10.0,
                  letterSpacing: 15,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: DropDownMenu(
                      items: product.colors,
                      onChanged: (value) {
                        setState(() {
                          selctedColor = value;
                        });
                      },
                      title: 'Color',
                      selctedItemDropDown: selctedColor == null
                          ? product.colors.first
                          : selctedColor,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: DropDownMenu(
                        items: product.sizes,
                        onChanged: (value) {
                          setState(() {
                            selctedSize = value;
                          });
                        },
                        title: 'Size',
                        selctedItemDropDown: selctedSize == null
                            ? product.sizes.first
                            : selctedSize),
                  ),
                ],
              ),
            ),
            Divider(
              color: Theme.of(context).primaryColor,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(
                          '2k rating',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 13.0,
                          ),
                        ),
                      ),
                      RatingBarIndicator(
                        rating: product.rating,
                        itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Theme.of(context).accentColor,
                        ),
                        itemCount: 5,
                        itemSize: 18.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40.0, vertical: 8.0),
              child: Text(
                product.description,
                maxLines: 3,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
              child: CustemRaisedButton(
                title: 'ADD TO CART',
                onPressed: () {
                  store.addToCart(CartModel(
                      imagePath: product.imageUrls.first,
                      name: product.name,
                      brand: product.brand,
                      price: product.price,
                      count: 1));
                  // setState(() {
                  //   cartCount = cartList.length;
                  // });
                },
              ),
            )
          ]))
        ],
      ),
    );
  }

  Widget buildSliverAppBar(BuildContext context) {
    var store = context.watch<CartList>();
    return SliverAppBar(
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height * 0.55,
      flexibleSpace: FlexibleSpaceBar(
        background: imageSlider(),
      ),
      actions: [
        Badge(
          showBadge: store.hasData(),
          badgeColor: Theme.of(context).scaffoldBackgroundColor,
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
          icon: Icon(favorite),
          onPressed: () {
            setState(() {
              if (favorite == Icons.favorite_border) {
                favorite = Icons.favorite;
              } else {
                favorite = Icons.favorite_border;
              }
            });
          },
        ),
      ],
    );
  }

  Widget imageSlider() {
    return Stack(alignment: Alignment.bottomRight, children: [
      CarouselSlider.builder(
        itemCount: product.imageUrls.length,
        itemBuilder: (context, index) {
          return index == 0
              ? Hero(
                  tag: product.imageUrls.first,
                  child: Image.network(
                    product.imageUrls[index],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : LinearProgressIndicator();
                    },
                  ),
                )
              : Image.network(
                  product.imageUrls[index],
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, progress) {
                    return progress == null ? child : LinearProgressIndicator();
                  },
                );
        },
        options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            initialPage: 0,
            enableInfiniteScroll: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: AnimatedSmoothIndicator(
            activeIndex: _current,
            count: product.imageUrls.length,
            duration: Duration(milliseconds: 500),
            effect: ExpandingDotsEffect(
                expansionFactor: 3,
                activeDotColor: Theme.of(context).scaffoldBackgroundColor,
                dotWidth: 10.0,
                dotHeight: 10.0),
          )),
    ]);
  }
}
