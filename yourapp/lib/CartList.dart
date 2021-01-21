import 'package:flutter/cupertino.dart';
import 'package:yourapp/const.dart';
import 'dart:core';
import 'model/CartModel.dart';

class CartList extends ChangeNotifier {
  List<CartModel> _cartList = [
    new CartModel(
      imagePath:
          'https://ae01.alicdn.com/kf/HTB1OQ3kXDHuK1RkSndVq6xVwpXa7/High-Quality-Fashion-Designer-Runway-Dress-2019-Autumn-Women-s-Half-Sleeve-O-Neck-Striped-Patchwork.jpg',
      name: 'Dress ',
      brand: 'ZARA',
      price: '\$200.0',
      count: 3,
    ),
    new CartModel(
      imagePath:
          'https://img.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-wearing-jeans-clothes-fashion-man_158538-5025.jpg?size=626&ext=jpg&ga=GA1.2.210018995.1604620800',
      name: 'Shert ',
      brand: 'H\&M',
      price: '\$600.0',
      count: 7,
    ),
    new CartModel(
      imagePath:
          'https://images.yaoota.com/PpP0EQ_ttO3_75DifUay8_ujY0c=/trim/yaootaweb-production/media/crawledproductimages/1e8f20ea33939e8eb9b0a391684954e8288e6e87.jpg',
      name: 'Jacket ',
      brand: 'T\&N',
      price: '\$10000.0',
      count: 2,
    ),
  ];

  addToCart(CartModel cartModel) {
    if (_cartList.any((element) => element.name == cartModel.name)) {
      print('true');
      int index =
          _cartList.indexWhere((element) => element.name == cartModel.name);
      addCount(index);
    } else {
      print('Faluse');
      _cartList.add(cartModel);
      notifyListeners();
    }
  }

  String calculateSubTotalPrice() {
    double price = 0;
    for (var item in _cartList) {
      price += (double.parse((item.price.split('\$').last)) * item.count);
    }
    return price.toStringAsFixed(2);
  }

  String totalPrice() {
    double price = double.parse(calculateSubTotalPrice());
    price += double.parse(shippingFee.split('\$').last) +
        double.parse(estimatedTax.split('\$').last);
    return price.toStringAsFixed(2);
  }

  removeFromCart(int index) {
    _cartList.removeAt(index);

    notifyListeners();
  }

  bool hasData() {
    if (_cartList.isNotEmpty) return true;
    return false;
  }

  int getCartItemsCount() {
    int length = 0;
    for (var item in _cartList) {
      length += item.count;
      print(length);
    }
    return length;
  }

  int getLength() {
    return _cartList.length;
  }

  addCount(int index) {
    _cartList.elementAt(index).count += 1;
    notifyListeners();
  }

  subtractCount(int index) {
    if (_cartList[index].count == 1) {
    } else {
      _cartList.elementAt(index).count -= 1;
    }
    notifyListeners();
  }

  List<CartModel> get cart => _cartList;
}
